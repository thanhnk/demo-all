<%@ include file="/apps/aemsolrsearch/components/global.jspx" %>
<%@ taglib prefix="cqsearch" uri="http://aemsolrsearch.headwire.com/taglibs/aemsolrsearch-taglib" %>

<%--
  | Note: If you wish to extend this JSP, only include valid JavaScript in the response, as this
  |       JSP is included by searchcontroller.jsp.
  --%>

<c:if test="${resultsEnabled}">
	
    
    AjaxSolr.ResultWidget = AjaxSolr.AbstractWidget.extend({
      start: 0,

      beforeRequest: function () {
        $(this.target).html($('<img>').attr('src', '/etc/clientlibs/aemsolrsearch/ajax-solr/images/ajax-loader.gif'));
      },

      facetLinks: function (facet_field, facet_values) {
        var links = [];
        if (facet_values) {
          for (var i = 0, l = facet_values.length; i < l; i++) {
            if (facet_values[i] !== undefined) {
              links.push(
                $('<a href="#"></a>')
                .text(facet_values[i])
                .click(this.facetHandler(facet_field, facet_values[i]))
              );
            }
            else {
              <%-- links.push('no items found in current selection'); --%>
            }
          }
        }
        return links;
      },

      facetHandler: function (facet_field, facet_value) {
        var self = this;
        return function () {
          self.manager.store.remove('fq');
          self.manager.store.addByValue('fq', facet_field + ':' + AjaxSolr.Parameter.escapeValue(facet_value));
          self.doRequest();
          return false;
        };
      },

      afterRequest: function () {
        $(this.target).empty();
        for (var i = 0, l = this.manager.response.response.docs.length; i < l; i++) {
          var doc = this.manager.response.response.docs[i];
          $(this.target).append(this.template(doc));

        }
        
        if (this.manager.response.spellcheck && this.manager.response.spellcheck.suggestions
			&& this.manager.response.spellcheck.suggestions.collation){
			var correctKey = this.manager.response.spellcheck.suggestions.collation.collationQuery;
        	var doYouMean = 'Did you mean: <a href="#" class="searchForSpellCheck">'+ correctKey + '</a>?';
        	$(this.target).parent().find('#spellchecking').html(doYouMean);
        	$(this.target).parent().find('#spellchecking > a').on('click', function(){
        		//alert($(this).html());
        		Manager.store.remove('q');
        		Manager.store.addByValue('q',  $(this).html());
        		Manager.doRequest();
        	});
        	
        } else {
        	$(this.target).parent().find('#spellchecking').html('');
        }
        
        if (this.manager.response.response.docs.length < 10 && 
        	this.manager.response.response.start + 10 < this.manager.response.response.numFound){
        	var searchWithoutGrouping = 'In order to show you the most relevant results, '
        	+ 'we have omitted some entries very similar to the 445 already displayed.'
        	+ 'If you like, you can ' + '<a href="#">repeat the search with the omitted results included.</a>';
        	$(this.target).parent().find('#searchWithoutGrouping').html(searchWithoutGrouping);
        	$(this.target).parent().find('#searchWithoutGrouping > a').on('click', function(){
        		Manager.store.addByValue('group', 'false');
        		Manager.doRequest();
        	});
        	
        } else {
        	$(this.target).parent().find('#searchWithoutGrouping').html('');
        }
      },

      template: function (doc) {
        var snippet = '';

        if( typeof doc.teaser != 'undefined') {
            if(doc.teaser.length > 250)
            {
                snippet += doc.teaser.substring(0, 250);
                snippet += '<span style="display:none">' + doc.teaser.substring(250);
                snippet += '</span> <a href="#" class="more">more</a>';
            }
            else
            {
                snippet += doc.teaser;
            }
        }

        var courseTitle = doc.courseTitle;
        var courseObjective = doc.courseObjective;
        var courseContent = doc.courseContent;
        var output = '';
        
        

        if(this.manager.response.highlighting && this.manager.response.highlighting[doc.id]) {
            if(this.manager.response.highlighting[doc.id]['courseTitle']) {
            	courseTitle = this.manager.response.highlighting[doc.id]['courseTitle'][0];
            }
            if(this.manager.response.highlighting[doc.id]['courseObjective']) {
            	courseObjective = this.manager.response.highlighting[doc.id]['courseObjective'][0];
            }
            if(this.manager.response.highlighting[doc.id]['courseContent']) {
            	courseContent = this.manager.response.highlighting[doc.id]['courseContent'][0];
            }
        }
        
        output += '<div class="result-card">';
        output += '<a target="_blank" href="/content/wda/en/course-view.html?id=' + doc.id + '" class="bootstrap-title">' + courseTitle + '</a>';
        output += '<div class="bootstrap-url">' + courseObjective + '</div>';
        output += '<div>' + courseContent + '</div></div>';


        return output;
      },

      init: function () {
        $(document).on('click', 'a.more', function () {
          var $this = $(this),
              span = $this.parent().find('span');

          if (span.is(':visible')) {
            span.hide();
            $this.text('more');
          }
          else {
            span.show();
            $this.text('less');
          }

          return false;
        });
      }
    });

    Manager.addWidget(new AjaxSolr.ResultWidget({
      id: '${resultsId}',
      target: '${resultsTarget}'
    }));
    
</c:if>
