<%@ include file="/apps/aemsolrsearch/components/global.jspx" %>
<%@ taglib prefix="cqsearch" uri="http://aemsolrsearch.headwire.com/taglibs/aemsolrsearch-taglib" %>

<%--
  | Note: If you wish to extend this JSP, only include valid JavaScript in the response, as this
  |       JSP is included by searchcontroller.jsp.
  --%>
<c:if test="${facetsEnabled}">

	var courseType = "";
	var courseLanguage = "";
	var courseArea = "";
	var selected = [];

	var count = 0;
	
    var showNumFacets = ${facetsShowNumFacets} - 1;
    $(".facet_container").delegate(".show-more", "click", function() {

        if ($(this).hasClass('show-me')) {
            $(this).parent().parent().find('li:gt(' + showNumFacets + ')').hide();
            $(this).text('${facetsShowMore}');
            $(this).parent().show();
        } else {
            $(this).parent().parent().find('li:gt(' + showNumFacets + ')').show();
            $(this).text('${facetsShowLess}');
        }

        $(this).toggleClass('show-me');
    });
    
    AjaxSolr.SimpleFacetWidget = AjaxSolr.AbstractFacetWidget.extend({
      afterRequest: function () {
        if (this.manager.response.facet_counts.facet_fields[this.field] === undefined) {
          $(this.target).html('No items found in current selection');
          return;
        }

        var maxCount = 0;
        var objectedItems = [];
        for (var facet in this.manager.response.facet_counts.facet_fields[this.field]) {
          var count = parseInt(this.manager.response.facet_counts.facet_fields[this.field][facet]);
          if (count > maxCount) {
            maxCount = count;
          }
          objectedItems.push({ facet: facet, count: count });
        }

        $(this.target).empty();

        var facetLabel = $(this.target).parent().find(".facet-heading").text();
        $(this.target).append('<li class="facet_item list-group-item active">' + facetLabel  + '</li>');

        for (var i = 0, l = objectedItems.length; i < l; i++) {
			var facet = objectedItems[i].facet;
	        $(this.target).append(
				$('<li class="facet_item list-group-item"><input type="checkbox" id="' + facet + '" value="' + facet + '">' + facet + ' (' + objectedItems[i].count + ')</li>'));

			// check all checkboxes
			for(var j = 0; j < selected.length; j++) {
				if(selected[j] == facet) {
					$("#" + facet).prop('checked', 'true');
				}
			}
			
        }

        $(this.target).find('li:gt(' + showNumFacets + ')').hide();
        if ($(this.target).find('li').length > showNumFacets) {
            $(this.target).find('li').last().after('<li class="list-group-item list-group-item-info"><a href="javascript:void(0)" class="show-more">${facetsShowMore}</a></li>');
        }

        if ( $(this.target).find('li').length <= 1) {
          $(this.target).find('li').last().after('<li class="facet_item list-group-item">No facets available</li>');
        }
      }
    });

    var fields = <cqsearch:json attribute="facetsAvailableFacetKeys"/>;

    for (var i = 0, l = fields.length; i < l; i++) {
        Manager.addWidget(new AjaxSolr.SimpleFacetWidget({
            id: fields[i],
            target: '#' + fields[i],
            field: fields[i]
        }));
    }


	// checkbox checked event
    $(document).on('change', '[type=checkbox]', function (e) {
		
		var parentId = "courseType_s";
		
		// quote used for Course Area
		var quote = '\"';
		
		if($('#' + $(this).attr('value')).is(":checked")) {
			
			// categorize facets depending on parent (type, language, area)
			if($(this).parents('ul').attr('id') == "courseType_s") {
			
				if(courseType == "") 
					courseType += '(' + $(this).attr('value') + ')';
				else {
					var temp = courseType.substring(0, courseType.length-1);
					courseType = temp + ' OR ' + $(this).attr('value') + ')';
				}
			}
			else if($(this).parents('ul').attr('id') == "courseLang_ss") {
				
				if(courseLanguage == "") 
					courseLanguage += '(' + $(this).attr('value') + ')';
				else {
					var temp = courseLanguage.substring(0, courseLanguage.length-1);
					courseLanguage = temp + ' OR ' + $(this).attr('value') + ')';
				}
			}
			else {
				if(courseArea == "")
					courseArea += '(\"' + $(this).attr('value') + '\")';
				else {
					var temp = courseArea.substring(0, courseArea.length-1);
					courseArea = temp + ' OR \"' + $(this).attr('value')  + '\")';
				}
			} 
			selected.push($(this).attr('value'));
		}
		else {
			
			// change it to get all checked checkboxes
			if($(this).parents('ul').attr('id') == "courseType_s") {
	
				var n = courseType.indexOf($(this).attr('value'));
				var substr = courseType.substring(n-3, n);
				
				if(substr == 'OR ') 
					courseType = courseType.replace(" OR " + $(this).attr('value'), '');
				else if(substr == '(') {
				
					if(courseType.indexOf('OR') == -1)
						courseType = courseType.replace($(this).attr('value'), '');
					else
						courseType = courseType.replace($(this).attr('value') + " OR ", '');
				}
			
				if(courseType == '()')
					courseType = "";
				
			}
			
			else if($(this).parents('ul').attr('id') == "courseLang_ss") {
				
				var n = courseLanguage.indexOf($(this).attr('value'));
				var substr = courseLanguage.substring(n-3, n);
				
				if(substr == 'OR ') 
					courseLanguage = courseLanguage.replace(" OR " + $(this).attr('value'), '');
				else if(substr == '(') {
				
					if(courseLanguage.indexOf('OR') == -1)
						courseLanguage = courseLanguage.replace($(this).attr('value'), '');
					else
						courseLanguage = courseLanguage.replace($(this).attr('value') + " OR ", '');
				}
				if(courseLanguage == '()')
					courseLanguage = "";
				
			}
			else {
				
				var n = courseArea.indexOf($(this).attr('value'));
				var substr = courseArea.substring(n-4, n-1);
				
				
				if(substr == 'OR ') 
					courseArea = courseArea.replace(" OR " + quote + $(this).attr('value') + quote, '');
				else if(substr == '(') {
				
					if(courseArea.indexOf('OR') == -1) {
						courseArea = courseArea.replace(quote + $(this).attr('value') + quote, '');
						
						}
					else 
						courseArea = courseArea.replace(quote + $(this).attr('value') + quote + " OR ", '');
				}
				if(courseArea == '()')
					courseArea = "";
					
			} 
			selected.splice($.inArray(quote + $(this).attr('value'), selected) + quote, 1 );
		}
		
		Manager.store.removeByValue('fq', new RegExp('^courseType_s:'));
		Manager.store.removeByValue('fq', new RegExp('^courseLang_ss:'));
		Manager.store.removeByValue('fq', new RegExp('^courseArea_s:'));
		
	    if(courseType != '' && courseType != '()')
	    	Manager.store.addByValue('fq', 'courseType_s:' + courseType);
	    if (courseLanguage != '')
	    	Manager.store.addByValue('fq', 'courseLang_ss:' + courseLanguage);
	    if (courseArea != '')
	    	Manager.store.addByValue('fq', 'courseArea_s:' + courseArea); 

	    	
	   Manager.doRequest();
			
	});
	
	

</c:if>
