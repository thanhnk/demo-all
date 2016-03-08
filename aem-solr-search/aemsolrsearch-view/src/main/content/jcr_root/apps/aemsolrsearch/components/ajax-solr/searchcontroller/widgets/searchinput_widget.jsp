<%@ include file="/apps/aemsolrsearch/components/global.jspx" %>
<%@ taglib prefix="cqsearch" uri="http://aemsolrsearch.headwire.com/taglibs/aemsolrsearch-taglib" %>

<%--
  | Note: If you wish to extend this JSP, only include valid JavaScript in the response, as this
  |       JSP is included by searchcontroller.jsp.
  --%>
<c:if test="${inputEnabled}">

	var searchurl = '';

    AjaxSolr.TextWidget = AjaxSolr.AbstractTextWidget.extend({
      init: function () {
        var self = this;
        $(this.target).find('input').bind('keydown', function(e) {
          if (e.which == 13) {
            var value = $(this).val();
            if (value && self.set(value)) {
              self.doRequest();
            }
          }
        });
        
       	//searchurl = this.manager.proxyUrl + '?' + 'qt=%2Fterms&limit=10&terms.sort=count&terms.fl=name&wt=velocity&v.template=suggest&corename=collection1';
       		//+ '&q=' + $(this).val() + '&terms.prefix=' + $(this).val();
       	searchurl = this.manager.proxyUrl + '?' + 'qt=%2Fselect&rows=0&wt=json&corename=collection1';
      },

      afterRequest: function () {
        $(this.target).find('input').val('');
      }
    });

    Manager.addWidget(new AjaxSolr.TextWidget({
      id: '${inputId}',
      target: '${inputTarget}'
    }));
    
    var beginFacetItem = true;
    var beginPhraseItem = true;
    jQuery("#query").autocomplete({
    	select: function( event, ui ) {
    		if (ui.item.facet != ''){
	    		//alert(ui.item.facet);
	    		Manager.store.removeByValue('fq', new RegExp('^courseArea_s:'));
	    		Manager.store.addByValue('fq', 'courseArea_s:"' + ui.item.facet + '"');
	    		Manager.store.addByValue('q',  ui.item.value);
	    		Manager.doRequest();
    		}
    	},
	    source: function (request, response) {
	    	beginFacetItem = true;
	    	beginPhraseItem = true;
	    	var result = [];
	    	var keyword = '';
	    	var keyword_point;
	    	// First ajax call for getting keywork/phrase
	    	var firstCallUrl = searchurl + '&q=*:*&facet=true&facet.limit=3&facet.field=suggest&facet.field=suggest_phrase&facet.prefix=' + request.term;
	    	jQuery.get(firstCallUrl, function (data) {
	    		var obj = jQuery.parseJSON(data);
	    		var list = obj.facet_counts.facet_fields.suggest;
	    		if (list.length > 0){
	    			keyword = list[0];
	    			keyword_point = list[1];
		    		for (var i = 0; i < list.length; i=i+2){
		            	if (list[i] != ''){
		            		result.push({label:list[i], value:list[i], facet:'',term:request.term});
		            	}
		            }
	            }
	            list = obj.facet_counts.facet_fields.suggest_phrase;
	    		if (list.length > 0){
	    			if (list[1] > keyword_point){
	    				keyword = list[0];
	    				keyword_point = list[1];
	    			}
	    			for (var i = 0; i < list.length; i=i+2){
		            	if (list[i] != ''){
		            		result.push({label:list[i], value:list[i], facet:'', phrase: true,term:request.term});
		            	}
		            }
	    		}
	    		
	    		// Second ajax call for getting facet
	    		var secondCallUrl = searchurl + '&facet=true&facet.field=courseArea_s&facet.limit=3&q=' + keyword;
	    		jQuery.get(secondCallUrl, function (data) {
	    			obj = jQuery.parseJSON(data);
	    			list = obj.facet_counts.facet_fields.courseArea_s;
	    			if (list.length > 0){
	    				for (var i = 0; i < list.length; i=i+2){
			            	if (list[i] != ''){
			            		result.push({label:keyword, value:keyword, facet:list[i],term:request.term});
			            	}
			            }
	    			}
	    			
	    			response(result);
	    		});
	    	});
	    	
	    }
	}).autocomplete("instance")._renderItem = function(ul, item){
   		//alert('render');
   		//jQuery("#queryFacet").val(item.facet)
   		
   		var label = '<b>' + item.term + '</b>' + item.label.substring(item.term.length);
   		
   		
   		if (item.phrase == true && beginPhraseItem){
   			var li = $( "<li>" ).append(label).appendTo(ul);
	        li.css('border-top', 'solid 1px gray');
		    	li.css('margin-top', '5px');
		    	li.css('padding-top', '5px');
		    	beginPhraseItem = false;
	        return li;
   		}
   		if (item.facet != ''){
	   		var li = $( "<li>" )
		        .append(label + '<span class="facetInputSearch"><b> in ' + item.facet + '</b></span>')
		        .appendTo(ul);
		        li.css('color', '#D2691E');
		    if (beginFacetItem){
		    	li.css('border-top', 'solid 1px gray');
		    	li.css('margin-top', '5px');
		    	li.css('padding-top', '5px');
		    	beginFacetItem = false;
		    }
		    return li;
   		}
   		
		return $( "<li>" )
	        .append(label)
	        .appendTo(ul);
   		
   	};
   	
</c:if>
