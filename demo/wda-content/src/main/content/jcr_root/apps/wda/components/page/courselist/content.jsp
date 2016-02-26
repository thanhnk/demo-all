<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@include file="/apps/wda/global/global.jsp"%>



	<cq:include path="breadcrumb" resourceType="wda/components/general/breadcrumb"/>
	
	<div class="container">
		<div class="fxw fxdc-md">
			<div class="col-md-1.8">
				<ul class="left-category mt10">
					<cq:include path="menu" resourceType="wda/components/general/sidemenu" />
				</ul>
			</div>
			<div class="rc col-md-11">
				<cq:include path="main-par" resourceType="foundation/components/parsys" />
			</div>
		</div>
	</div>

