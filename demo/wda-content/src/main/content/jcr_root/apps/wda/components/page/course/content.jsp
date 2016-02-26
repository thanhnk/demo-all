<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.sling.api.resource.Resource"%>
<%@page import="javax.jcr.Node"%>
<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@include file="/apps/wda/global/global.jsp"%>
<%
String authorPath = properties.get("instructor", "");
String authorAvatarPath = "/etc/designs/default/images/social/avatar.png";
Node authorNode = null;
if (authorPath.length() > 0) {
    // Get the author's profile node
    Resource authorResource = resourceResolver.getResource(authorPath + "/profile");
    if (authorResource != null) {
        authorNode = authorResource.adaptTo(Node.class);
    }
    String authorImageNodePath = authorPath + "/profile/photos/primary/image";
    Resource authorImageNode = resourceResolver.getResource(authorImageNodePath);
    if (authorImageNode != null) {
        // Render a 36x36 thumbnail of their profile image
        authorAvatarPath = request.getContextPath() + authorImageNodePath + ".prof.thumbnail.40.jpg";
    }
}

String authorName = "";
if (authorNode != null) {
    if (authorNode.hasProperty("givenName")) {
        authorName = authorNode.getProperty("givenName").getString() + " ";

    }
    if (authorNode.hasProperty("familyName")) {
        authorName += authorNode.getProperty("familyName").getString();
    }
}
if (authorName.length() == 0) {
    authorName = i18n.get("Anonymous");
}

String publishedDateString = null;
if (currentNode != null && currentNode.hasProperty("publishedDate")) {
    Calendar publishedDate = currentNode.getProperty("publishedDate").getDate();
    SimpleDateFormat dateFormat = new SimpleDateFormat(i18n.get("MM/dd/yyyy"));
    publishedDateString = dateFormat.format(publishedDate.getTime());
}
else {
    publishedDateString = i18n.get("No date");
}
%>
<div class="one-col-landing ud-page ">

	<cq:include path="breadcrumb" resourceType="wda/components/general/breadcrumb"/>
	
	<div class="main-top">
		<div class="container">
			<div class="row course-desc">
				<div class="col-md-12">
	
					
					<div class="ci-d">
						<%String description = currentPage.getDescription() != null ? currentPage.getDescription() : "N.A"; %>
						<%= description %>
					</div>
	
					<!-- <div class="enrolled">
						<span class="rate fxac flex-col-xs">
							<a href="#reviews">
								<span class="s-rating smaller maroon static stars">
									<span style="width: 98.7272%;"></span>
								</span>
								<span class="rate-count ml10">
									220 ratings, 10,889 students enrolled
								</span>
							</a>
						</span>
					</div> -->
					<div class="by mb10 flex-col-xs">
						<div class="col-sm-12">
		                    <h3 class="tab-title">Instructed by</h3>
		                </div>
		                <div class="col-sm-2 ud-discover-tracker" style="width: 70px;">
		                    <img style="width: 40px;" src="<%= xssAPI.encodeForHTMLAttr(authorAvatarPath) %>">
		                </div>
		                <div class="ins-info ud-discover-tracker">
	                        <%= authorName %>
	                    </div>
						
						<!-- <span class="cats">
							<a class="cd-ca" href="/courses/Development/">Development</a>
							/
							<a class="" href="/courses/Development/Web-Development/">Web Development</a>
						</span> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main-details mt10">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7" data-purpose="introduction-video">
					<cq:include path="image-par" resourceType="foundation/components/parsys" />
				</div>
				<div class="col-lg-4 col-md-5">
					<div class="row fxdc right-wrap mh0-force-md">
						<div class="fxw-md fdrr-md db-force-xs">
							<div class="right-top col-md-12 col-sm-6">
	
								<div class="take-btn">
									<div class="price fxac">
										<span class="current-price" data-purpose="discount-price-text">
											<%
	    										double oldPrice = properties.get("oldPrice", 0.0);
	                                        	double discount = properties.get("discount", 0.0);
	                                        	
	                                        	double discountedPrice = oldPrice * (100 - discount) / 100;
											%>
											<%= "S$" + Math.round(Math.ceil(discountedPrice)) %>
										</span>
										<div class="save-money dib ml10">
											<span data-purpose="course-price-text" class="old-price ">
	                                            <%= "S$" + Math.round(oldPrice) %>
											</span>
										</div>
										<span data-purpose="discount-rate" class="ml10 save-money">
	                                        <%= Math.round(discount) + "% off" %>
	                                    </span>
									</div>
<!-- 									<a -->
<!-- 										href="/payment/checkout/?boId=533682&amp;boType=course&amp;is_dj=1&amp;couponCode=WELCOMESALE24" -->
<!-- 										data-purpose="take-this-course-button" -->
<!-- 										class="btn btn-lg m10-0 course-cta course-cta--buy ud-popup" -->
<!-- 										data-requirelogin="true" -->
<!-- 										data-signuppopupidentifier="button-enroll-b" data-padding="0"> -->
<!-- 										Take This Course </a> -->

									<button type="button" onclick="">Take This Course</button>  
								</div>
	
								<!-- <ul class="act-links">
	
									<li class="act-links-item nlp-coupon pos-r ud-discover-tracker"
										data-action="coupon-code-redeem-clicked"
										data-user-id="XwZHLQ==" data-course-id="BEAYd1ZQ"
										data-target-selector-class="js-discover-tracker-elm"><a
										href="https://www.udemy.com/payment/checkout/?boId=533682&amp;boType=course&amp;showCouponCode=1"
										class="act-link js-discover-tracker-elm redeem"
										data-wrapcss="static-content-wrapper payment-popup"
										data-enableloader="true" data-purpose="redeem-link"
										data-overlayclosable="false" data-course-id="533682">
											Redeem a Coupon </a>
										<div class="form">
											<i class="icon-sort-down arrow"></i>
											<form>
												<div class="fxac">
													<div class="fx mr10">
														<h4 class="m0 fs14 text-success">Enter Your Redemption
															Code</h4>
													</div>
													<div>
														<a href="#" class="close"> <i class="icon-remove-sign"></i>
														</a>
													</div>
												</div>
												<div class="mt10 fxac">
													<input type="hidden" name="ccManual">
													<div class="fx mr10">
														<input type="text" name="couponCode" class="mw100 input-sm"
															data-purpose="coupon-code" />
													</div>
													<div>
														<input type="submit" class="btn btn-info btn-sm"
															value="Apply" data-purpose="apply-coupon" />
													</div>
												</div>
											</form>
										</div></li>
	
									<li class="act-links-item ud-discover-tracker"
										data-action="watch-free-preview-clicked"
										data-user-id="XwZHLQ==" data-course-id="BEAYd1ZQ"
										data-target-selector-class="js-discover-tracker-elm"><a
										class="act-link js-discover-tracker-elm ud-popup"
										data-requirelogin="true"
										data-signuppopupidentifier="button-preview-b"
										href="https://www.udemy.com/course/preview-subscribe/?courseId=533682">
											Start Free Preview </a></li>
	
									<li class="act-links-item">
										<div class="btn-group">
											<div class="dropdown-toggle" data-toggle="dropdown">
												<a href="#" data-purpose="more-options"> More Options <i
													class="icon icon-caret-down"></i>
												</a>
											</div>
											<div class="dropdown-menu">
												<ul>
													<li>Gift this course</li>
													<li>Bulk Purchase</li>
													<li><i class="icon-flag">
														</i> Report Abuse</li>
												</ul>
											</div>
										</div>
									</li>
								</ul> -->
							</div>
	
							<div class="right-middle col-md-11 col-sm-6">
								<ul class="list">
									<li class="list-item">
										<span class="list-left">Lectures</span> 
										<span class="list-right"> 
											<% double lecture = properties.get("lecture", 0.0); %>
	                                        <%= Math.round(lecture) %> <br/>
										</span>
									</li>
									<li class="list-item">
										<span class="list-left">Video</span>
										<span class="list-right">
											<%String videolength = properties.get("videolength", "99"); %>
		                                    <%= videolength %> Hours</span>
									</li>
									<li class="list-item">
										<span class="list-left">Skill Level</span> 
										<span class="list-right">
											<%String skillLevel = properties.get("skilllevel", "N.A"); %>
	                                    	<%= skillLevel %> 
										</span>
									</li>
									<li class="list-item">
										<span class="list-left">Languages</span>
										<span class="list-right"> 
											<%
												boolean isTrue = false;
												String language = "";
												String languages[] = {"en", "zh", "ms", "ta"};
												
												for(String lan: languages) {
													if(isTrue = properties.get(lan, false)) {
														
														if(isTrue) {
															
															switch(lan) {
															case "en": language ="English "; break;
															case "zh": language +="Chinese "; break;
															case "ms": language +="Malay "; break;
															case "ta": language +="Tamil "; break;
															}
														}
													}
												}
											%>
											<%= language %>
	                                    	
	                                    </span>
									</li>
									<li class="list-item"><span class="list-left">Includes</span>
										<span class="list-right"> 
										<span data-purpose="incentive-lifetime-access"> 
											<%String accessrights = properties.get("accessrights", "No information of access rights"); %>
	                                    	<%= accessrights %> 
										</span> <br> 
										<span data-purpose="incentive-money-back-guarantee"> 
											<%
												boolean isWarranty = properties.get("warranty", false); 
												String warranty = "No warranty";
	
	                                            if(isWarranty) {
	                                                warranty="30 day money back guarantee!";
	                                            }
											%>
	                                    	<%= warranty %> 
										</span> <br> 
										<span data-purpose="incentive-mobile">
	                                        <%
												boolean isIOS = properties.get("ios", false); 
												boolean isAndroid = properties.get("android", false);
												String availability = "Not available on mobile platform";
												
												if(isIOS && isAndroid) {
													availability = "Available on iOS and Android";
												}
												else if(isIOS) {
													availability = "Available on iOS";
												}
												else if(isAndroid) {
													availability = "Available on Android";
												}
											%>
	                                    	<%= availability %> <br>
										</span> <span data-purpose="incentive-certificate">
											<%
												boolean isCertificate = properties.get("certificate", false); 
												String certificate = "No certification";
	
	                                            if(isCertificate) {
	                                            	certificate="Certificate of Completion";
	                                            }
											%>
	                                    	<%= certificate %>
										</span> <br>
									</span></li>
								</ul>
							</div>
							<div class="clearfix visible-xs-block"></div>
						</div>
						<div class="right-bottom col-md-12">
							<div class="fxw social-links ud-discover-tracker"
								data-action="add-to-wishlist-clicked" data-course-id="BEAYd1ZQ"
								data-target-selector-class="js-discover-tracker-elm">
	
<!-- 								<a href="/wishlist/add/?courseId=533682" data-purpose="wishlist" -->
<!-- 									data-course-id="533682" data-is-wishlisted="false" -->
<!-- 									class="course-cta course-cta--wishlist ud-wishlist ud-popup" data-requirelogin="true" -->
<!-- 									data-signuppopupidentifier="button-wishlist">  -->
									<i class="icon fa fa-heart icon-heart in-wishlist none"></i> 
									<i class="icon fa fa-heart-o icon-heart-empty not-in-wishlist"></i>
									<span class="in-wishlist none" data-purpose="in-wishlist">Wishlisted </span> 
									<span class="not-in-wishlist" data-purpose="not-in-wishlist">Wishlist
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main-middle fs12-xs show-nav-on-this">
		<div class="container">
			<div class="row">
				<div class="col-md-8 pb50">
					<cq:include path="main-par" resourceType="foundation/components/parsys" />
				</div>
				<div class="col-md-4 hidden-sm">
					<cq:include path="right-par" resourceType="foundation/components/parsys" />
				</div>
			</div>
		</div>
	</div>

</div>

