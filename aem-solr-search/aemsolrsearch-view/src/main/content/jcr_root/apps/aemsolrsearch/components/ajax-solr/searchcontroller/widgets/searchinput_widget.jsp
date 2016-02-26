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
        
       	searchurl = this.manager.proxyUrl + '?' + 'qt=%2Fterms&limit=10&terms.sort=count&terms.fl=name&wt=velocity&v.template=suggest&corename=collection1';
       		//+ '&q=' + $(this).val() + '&terms.prefix=' + $(this).val();
      },

      afterRequest: function () {
        $(this.target).find('input').val('');
      }
    });

    Manager.addWidget(new AjaxSolr.TextWidget({
      id: '${inputId}',
      target: '${inputTarget}'
    }));
    
    jQuery("#query").autocomplete({
	    source: function (request, response) {
	        jQuery.get(searchurl + '&q=' + request.term + '&terms.prefix=' + request.term, {
	            query: ''
	        }, function (data) {
	            // assuming data is a JavaScript array such as
	            // ["one@abc.de", "onf@abc.de","ong@abc.de"]
	            // and not a string
	            var list = data.trim().split(' ');
	            var result = [];
	            for (var i = 0; i < list.length; i++){
	            	if (list[i] != ''){
	            		result.push(list[i]);
	            	}
	            }
	            response(result);
	        });
	    }
	});
</c:if>
