
<div class="channel-head" style="">
	<div class="container" ng-show="channelPage.bannerUrl == ''">
		<channel-breadcrumb parent-channel="channelPage.parentChannel"
			channel-title="channelPage
		  .title" ng-style="">
		<div class="bread mt20">
			<a ng-href="/courses" ng-attr-title="{{ 'Home' | translate }}"
				href="/courses" title="Home"><i class="icon-home"></i></a> <a
				ng-show="parentChannel.url" ng-href=""
				ng-attr-title="{{::parentChannel.title | translate}}" title=""
				class="ng-hide">/ </a> <span>/ Development</span>
		</div>
		</channel-breadcrumb>
		<h1 class="fs30 ellipsis">Development</h1>
		<ul class="nav nav-tabs tabs mt10" role="tablist">
			<!-- ngRepeat: tab in channelPage.tabs -->
			<li loc-ref-active="active" ng-repeat="tab in channelPage.tabs"
				class="active"><a loc-ref="" ng-href="./" role="tab"
				ng-show="::tab.title == 'Featured'"
				class="fs13 color-white link m0-5 pb20" translate="" href="./"><span
					class="">Featured</span></a> <a loc-ref="" ng-href="./" role="tab"
				ng-show="::tab.title == 'All Courses'"
				class="fs13 color-white link m0-5 pb20 ng-hide" translate=""
				href="./"><span class="">All Courses</span></a></li>
			<!-- end ngRepeat: tab in channelPage.tabs -->
			<li loc-ref-active="active" ng-repeat="tab in channelPage.tabs"
				class=""><a loc-ref="" ng-href="./all-courses/" role="tab"
				ng-show="::tab.title == 'Featured'"
				class="fs13 color-white link m0-5 pb20 ng-hide" translate=""
				href="./all-courses/"><span class="">Featured</span></a> <a
				loc-ref="" ng-href="./all-courses/" role="tab"
				ng-show="::tab.title == 'All Courses'"
				class="fs13 color-white link m0-5 pb20" translate=""
				href="./all-courses/"><span class="">All Courses</span></a></li>
			<!-- end ngRepeat: tab in channelPage.tabs -->
		</ul>
	</div>
</div>


<div class="tab-content" ng-view="">
	<div class="container" ng-show="channelPage.currentChannel">

		<div class="fxw fxdc-md">
			<div class="lc dn-md">
				<promotion ng-show="promotionCtrl.isPromotionExists()"><!-- ngIf: promotion.isToggleBtnAvailable -->
				<div class="generic-promotion-left mr20"
					ng-if="promotion.isToggleBtnAvailable">
					<div class="updating-box ">
						<div class="fxac h100p">
							<div class="w100p">
								<div>
									<i class="icon-spinner icon-spin"></i>
								</div>
								<div class="fs13">
									Loading... <br> Please wait
								</div>
							</div>
						</div>
					</div>
					<div class="promotion-toggle">
						<div class="first-line fs13-md mb5-md">Show Only Courses On
							Sale</div>
						<div class="action">
							<!-- ngIf: promotion.isActive -->
							<a ng-click="promotionCtrl.togglePromotion()"
								ng-if="promotion.isActive"
								class="js-generic-promotion-toggler toggle-btn bf-toggle-btn on">
								On <span></span>
							</a>
							<!-- end ngIf: promotion.isActive -->
							<!-- ngIf: !promotion.isActive -->
						</div>
					</div>
				</div>
				<!-- end ngIf: promotion.isToggleBtnAvailable --></promotion>
				<div class="dn-md">
					<!-- ngIf: channelPage.showRelatedTopics() -->
					<!-- ngIf: channelPage.showMoreInChannel() -->
					<b class="mt10 fs12 db" ng-if="channelPage.showMoreInChannel()">
						More in Development</b>
					<!-- end ngIf: channelPage.showMoreInChannel() -->
					<ul class="left-category mt10">
						<!-- ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/web-development/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_web-development"></span></span>
								<span class="chan-title">Web Development</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/mobile-apps/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_mobile-apps"></span></span> <span
								class="chan-title">Mobile Apps</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/programming-languages/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_programming-languages"></span></span>
								<span class="chan-title">Programming Languages</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/game-development/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_game-development"></span></span>
								<span class="chan-title">Game Development</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/databases/" target="_self"
							class="skin-color fxjc-md"> <span class="chan-icon"><span
									class="ud_databases"></span></span> <span class="chan-title">Databases</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/software-testing/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_software-testing"></span></span>
								<span class="chan-title">Software Testing</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/software-engineering/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_software-engineering"></span></span>
								<span class="chan-title">Software Engineering</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/e-commerce/" target="_self"
							class="skin-color fxjc-md"> <span class="chan-icon"><span
									class="ud_e-commerce"></span></span> <span class="chan-title">E-Commerce</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
						<related-channel channel="channel"
							ng-repeat="channel in channelPage.relatedChannels" class="">
						<li><a href="/courses/development/development-tools/"
							target="_self" class="skin-color fxjc-md"> <span
								class="chan-icon"><span class="ud_development-tools"></span></span>
								<span class="chan-title">Development Tools</span>
						</a></li>
						</related-channel>
						<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					</ul>
				</div>

			</div>
			<div class="rc fx pt0-force-md">
				<div class="dn db-md full-width bg-whiteSmokeLight mb10">
					<div class="promotion-wrap-horizontal flex-ae wa p20-0">
						<div class="promotion-container">
							<promotion ng-show="promotionCtrl.isPromotionExists()"><!-- ngIf: promotion.isToggleBtnAvailable -->
							<div class="generic-promotion-left mr20"
								ng-if="promotion.isToggleBtnAvailable">
								<div class="updating-box ">
									<div class="fxac h100p">
										<div class="w100p">
											<div>
												<i class="icon-spinner icon-spin"></i>
											</div>
											<div class="fs13">
												Loading... <br> Please wait
											</div>
										</div>
									</div>
								</div>
								<div class="promotion-toggle">
									<div class="first-line fs13-md mb5-md">Show Only Courses
										On Sale</div>
									<div class="action">
										<!-- ngIf: promotion.isActive -->
										<a ng-click="promotionCtrl.togglePromotion()"
											ng-if="promotion.isActive"
											class="js-generic-promotion-toggler toggle-btn bf-toggle-btn on">
											On <span></span>
										</a>
										<!-- end ngIf: promotion.isActive -->
										<!-- ngIf: !promotion.isActive -->
									</div>
								</div>
							</div>
							<!-- end ngIf: promotion.isToggleBtnAvailable --></promotion>
						</div>
						<div class="">
							<!-- ngIf: channelPage.showRelatedTopics() -->
							<!-- ngIf: channelPage.showMoreInChannel() == '' -->
						</div>

					</div>
				</div>

				<!-- ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">Become a Web
						Developer</h2>
					<a href="all-courses" class="skin-color fxje fx link dn-lg ng-hide"
						ng-show="unit.url_filter"></a> <a href=""
						ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<course-list-unit unit="unit">
				<ul class="fxjsb hidden-holder mb20 content-loader--card none"
					ng-class="{none: done}" done="cntl.courses">
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
				</ul>
				<!-- ngRepeat: n in range(numOfCourseList) -->
				<ul class="discover-courses-list channel-courses-list"
					ng-repeat="n in range(numOfCourseList)">
					<!-- ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="185774"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=185774"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/complete-web-developer-course/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">236 lectures</span></span> <span class="row-two"
									translate=""><span class="">28 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/185774_cb62_3.jpg"
								alt="The Complete Web Developer Course - Build 14 Websites"
								src="https://udemy-images.udemy.com/course/480x270/185774_cb62_3.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg"
										alt="Rob Percival"
										src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> The Complete Web
									Developer Course - Build 14 Websites </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Rob Percival <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Web Developer And Teacher </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 96.1372%;"></span>
								</span> <span translate=""><span class="">(15170)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="80940"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=80940"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/build-website-scratch/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">77 lectures</span></span> <span class="row-two" translate=""><span
										class="">8 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/80940_2664_8.jpg"
								alt="Build Websites from Scratch with HTML &amp; CSS"
								src="https://udemy-images.udemy.com/course/480x270/80940_2664_8.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <span
									class="avatar"
									ng-if="::course.visible_instructors.length === 2"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/422607_77b6_8.jpg"
										alt="Brad Hussey"
										src="https://udemy-images.udemy.com/user/50x50/422607_77b6_8.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 2"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/13289904_5c6e_2.jpg"
										alt="Code College"
										src="https://udemy-images.udemy.com/user/50x50/13289904_5c6e_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Build Websites from
									Scratch with HTML &amp; CSS </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<!-- ngIf: ::course.visible_instructors.length === 2 --> <span
								class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 2" translate=""><span
									class="">Brad Hussey, Code College</span></span> <!-- end ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 95.4%;"></span>
								</span> <span translate=""><span class="">(600)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$213</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="8324"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=8324"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/beginning-javascript/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">47 lectures</span></span> <span class="row-two" translate=""><span
										class="">3 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/8324_fa84_13.jpg"
								alt="Javascript for Beginners"
								src="https://udemy-images.udemy.com/course/480x270/8324_fa84_13.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/11439_12bd_8.jpg"
										alt="LearnToProgram, Inc."
										src="https://udemy-images.udemy.com/user/50x50/11439_12bd_8.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Javascript for
									Beginners </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> LearnToProgram, Inc. <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Learn Web, Mobile and Game Development </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 84.1176%;"></span>
								</span> <span translate=""><span class="">(102)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$141</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="625204"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=625204"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/the-web-developer-bootcamp/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">273 lectures</span></span> <span class="row-two"
									translate=""><span class="">40 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/625204_436a_2.jpg"
								alt="The Web Developer Bootcamp"
								src="https://udemy-images.udemy.com/course/480x270/625204_436a_2.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/4466306_6fd8_2.jpg"
										alt="Colt Steele"
										src="https://udemy-images.udemy.com/user/50x50/4466306_6fd8_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> The Web Developer
									Bootcamp </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Colt Steele <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Developer and Bootcamp Instructor </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 98.8444%;"></span>
								</span> <span translate=""><span class="">(225)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$355</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
				</ul>
				<!-- end ngRepeat: n in range(numOfCourseList) --> <a
					href="All-Courses"
					class="skin-color link dn db-lg mt-10 mb20 bb1 pb5 ng-hide"
					ng-show="unit.url_filter"></a></course-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">Build Your
						First Mobile App</h2>
					<a href="all-courses" class="skin-color fxje fx link dn-lg ng-hide"
						ng-show="unit.url_filter"></a> <a href=""
						ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<course-list-unit unit="unit">
				<ul class="fxjsb hidden-holder mb20 content-loader--card none"
					ng-class="{none: done}" done="cntl.courses">
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
				</ul>
				<!-- ngRepeat: n in range(numOfCourseList) -->
				<ul class="discover-courses-list channel-courses-list"
					ng-repeat="n in range(numOfCourseList)">
					<!-- ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="555100"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=555100"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/ios9-swift/" class="mask">
							<span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">146 lectures</span></span> <span class="row-two"
									translate=""><span class="">38 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/555100_bdbe_4.jpg"
								alt="iOS 9 and Swift 2: From Beginner to Paid Professional"
								src="https://udemy-images.udemy.com/course/480x270/555100_bdbe_4.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/14214490_3956.jpg"
										alt="Mark Price"
										src="https://udemy-images.udemy.com/user/50x50/14214490_3956.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> iOS 9 and Swift 2:
									From Beginner to Paid Professional </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Mark Price <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , iOS 9, Swift 2, React &amp; Flux Developer,
										Teacher </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 98.4408%;"></span>
								</span> <span translate=""><span class="">(667)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="326094"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=326094"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/android-marshmallow-java-app-development-course/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">245 lectures</span></span> <span class="row-two"
									translate=""><span class="">48 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/326094_9b39_6.jpg"
								alt="Master Android 6.0 Marshmallow Apps Development Using Java"
								src="https://udemy-images.udemy.com/course/480x270/326094_9b39_6.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <span
									class="avatar"
									ng-if="::course.visible_instructors.length === 2"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/599932_71aa.jpg"
										alt="Tim Buchalka"
										src="https://udemy-images.udemy.com/user/50x50/599932_71aa.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 2"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/11566988_f5b1_2.jpg"
										alt="Jean-Paul Roberts"
										src="https://udemy-images.udemy.com/user/50x50/11566988_f5b1_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Master Android 6.0
									Marshmallow Apps Development Using Java </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<!-- ngIf: ::course.visible_instructors.length === 2 --> <span
								class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 2" translate=""><span
									class="">Tim Buchalka, Jean-Paul Roberts</span></span> <!-- end ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 97.1618%;"></span>
								</span> <span translate=""><span class="">(1212)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="528422"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=528422"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/the-complete-ios-9-developer-course/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">208 lectures</span></span> <span class="row-two"
									translate=""><span class="">29 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/528422_f4f0_2.jpg"
								alt="The Complete iOS 9 Developer Course - Build 18 Apps"
								src="https://udemy-images.udemy.com/course/480x270/528422_f4f0_2.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg"
										alt="Rob Percival"
										src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> The Complete iOS 9
									Developer Course - Build 18 Apps </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Rob Percival <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Web Developer And Teacher </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 96.9332%;"></span>
								</span> <span translate=""><span class="">(1963)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="428526"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=428526"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/the-complete-android-developer-course/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">229 lectures</span></span> <span class="row-two"
									translate=""><span class="">31 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/428526_9c24_2.jpg"
								alt="The Complete Android Developer Course - Build 14 Apps"
								src="https://udemy-images.udemy.com/course/480x270/428526_9c24_2.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg"
										alt="Rob Percival"
										src="https://udemy-images.udemy.com/user/50x50/4387876_78bc.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> The Complete Android
									Developer Course - Build 14 Apps </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Rob Percival <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Web Developer And Teacher </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 97.274%;"></span>
								</span> <span translate=""><span class="">(741)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
				</ul>
				<!-- end ngRepeat: n in range(numOfCourseList) --> <a
					href="All-Courses"
					class="skin-color link dn db-lg mt-10 mb20 bb1 pb5 ng-hide"
					ng-show="unit.url_filter"></a></course-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">Top Paid
						Courses in Development</h2>
					<a href="all-courses?price=price-paid"
						class="skin-color fxje fx link dn-lg" ng-show="unit.url_filter">Browse
						all</a> <a href="" ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<course-list-unit unit="unit">
				<ul class="fxjsb hidden-holder mb20 content-loader--card none"
					ng-class="{none: done}" done="cntl.courses">
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
				</ul>
				<!-- ngRepeat: n in range(numOfCourseList) -->
				<ul class="discover-courses-list channel-courses-list"
					ng-repeat="n in range(numOfCourseList)">
					<!-- ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="289230"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=289230"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/learn-angularjs/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">55 lectures</span></span> <span class="row-two" translate=""><span
										class="">7 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/289230_1056_16.jpg"
								alt="Learn and Understand AngularJS"
								src="https://udemy-images.udemy.com/course/480x270/289230_1056_16.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg"
										alt="Anthony Alicea"
										src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Learn and Understand
									AngularJS </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Anthony Alicea <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Software Developer, Architect, and UX
										Designer </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 97.9446%;"></span>
								</span> <span translate=""><span class="">(2783)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$141</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="364426"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=364426"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/understand-javascript/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">85 lectures</span></span> <span class="row-two" translate=""><span
										class="">12 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/364426_2991_5.jpg"
								alt="JavaScript: Understanding the Weird Parts"
								src="https://udemy-images.udemy.com/course/480x270/364426_2991_5.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg"
										alt="Anthony Alicea"
										src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> JavaScript:
									Understanding the Weird Parts </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Anthony Alicea <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Software Developer, Architect, and UX
										Designer </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 98.8604%;"></span>
								</span> <span translate=""><span class="">(2808)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$213</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="437398"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=437398"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/design-and-develop-a-killer-website-with-html5-and-css3/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">77 lectures</span></span> <span class="row-two" translate=""><span
										class="">12 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/437398_46c3_7.jpg"
								alt="Build Responsive Real World Websites with HTML5 and CSS3"
								src="https://udemy-images.udemy.com/course/480x270/437398_46c3_7.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/7799204_2091_5.jpg"
										alt="Jonas Schmedtmann"
										src="https://udemy-images.udemy.com/user/50x50/7799204_2091_5.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Build Responsive Real
									World Websites with HTML5 and CSS3 </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Jonas Schmedtmann <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Bestselling Instructor, Web Designer and
										Developer </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 97.7956%;"></span>
								</span> <span translate=""><span class="">(744)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="461160"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=461160"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/understand-nodejs/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">91 lectures</span></span> <span class="row-two" translate=""><span
										class="">12 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/461160_8d87_6.jpg"
								alt="Learn and Understand NodeJS"
								src="https://udemy-images.udemy.com/course/480x270/461160_8d87_6.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg"
										alt="Anthony Alicea"
										src="https://udemy-images.udemy.com/user/50x50/2467626_f2e0.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Learn and Understand
									NodeJS </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Anthony Alicea <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Software Developer, Architect, and UX
										Designer </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 97.6744%;"></span>
								</span> <span translate=""><span class="">(860)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$213</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
				</ul>
				<!-- end ngRepeat: n in range(numOfCourseList) --> <a
					href="All-Courses?price=price-paid"
					class="skin-color link dn db-lg mt-10 mb20 bb1 pb5"
					ng-show="unit.url_filter">Browse all</a></course-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">New And
						Noteworthy in Development</h2>
					<a href="all-courses" class="skin-color fxje fx link dn-lg ng-hide"
						ng-show="unit.url_filter"></a> <a href=""
						ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<course-list-unit unit="unit">
				<ul class="fxjsb hidden-holder mb20 content-loader--card none"
					ng-class="{none: done}" done="cntl.courses">
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
				</ul>
				<!-- ngRepeat: n in range(numOfCourseList) -->
				<ul class="discover-courses-list channel-courses-list"
					ng-repeat="n in range(numOfCourseList)">
					<!-- ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="736940"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=736940"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/css-website-development-crash-course/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">17 lectures</span></span> <span class="row-two" translate=""><span
										class="">2 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/736940_0fb1_5.jpg"
								alt="Practical CSS Website Development: Crash Course "
								src="https://udemy-images.udemy.com/course/480x270/736940_0fb1_5.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/412299_e4df_12.jpg"
										alt="Syed Raza"
										src="https://udemy-images.udemy.com/user/50x50/412299_e4df_12.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Practical CSS Website
									Development: Crash Course </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Syed Raza <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Professor, IT Expert, and Attorney </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 100%;"></span>
								</span> <span translate=""><span class="">(2)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$281</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="722754"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=722754"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/wordpress-development-crash-course/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">21 lectures</span></span> <span class="row-two" translate=""><span
										class="">2 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/722754_244b.jpg"
								alt="WordPress Development Crash Course: From Zero To Hero"
								src="https://udemy-images.udemy.com/course/480x270/722754_244b.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/16732856_8a3e_2.jpg"
										alt="Syed Ali"
										src="https://udemy-images.udemy.com/user/50x50/16732856_8a3e_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> WordPress Development
									Crash Course: From Zero To Hero </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Syed Ali <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Programmer and IT Networking Expert </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 100%;"></span>
								</span> <span translate=""><span class="">(3)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$141</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="695952"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=695952"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a href="/git-for-geeks/" class="mask">
							<span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">76 lectures</span></span> <span class="row-two" translate=""><span
										class="">3 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/695952_eaa1.jpg"
								alt="Git for Geeks: Quick Git Training for Developers"
								src="https://udemy-images.udemy.com/course/480x270/695952_eaa1.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/5341724_4617_2.jpg"
										alt="Jason Taylor"
										src="https://udemy-images.udemy.com/user/50x50/5341724_4617_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Git for Geeks: Quick
									Git Training for Developers </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Jason Taylor <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Sr Software Engineer, Technical Trainer, SCM
										Ninja </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 80%;"></span>
								</span> <span translate=""><span class="">(1)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$70</span> <!-- end ngIf: course.is_paid==true --> <!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small promotion" data-courseid="742712"
						course="course" ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=742712"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/css-tutorial-for-beginners-style-your-wordpress-templates/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">47 lectures</span></span> <span class="row-two" translate=""><span
										class="">3 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/742712_3645_7.jpg"
								alt="CSS Tutorial For Beginners: Style Your Wordpress Templates"
								src="https://udemy-images.udemy.com/course/480x270/742712_3645_7.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/11566666_1377_2.jpg"
										alt="Eddie Makes"
										src="https://udemy-images.udemy.com/user/50x50/11566666_1377_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> CSS Tutorial For
									Beginners: Style Your Wordpress Templates </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Eddie Makes <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Udemy Instructor </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 100%;"></span>
								</span> <span translate=""><span class="">(3)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span ng-if="course.promotion_price" class=""> <span
										class="promotion-badge fs13-force-xs lh18-force-xs">S$35</span>
								</span> <!-- end ngIf: course.promotion_price --> <span
									class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<span ng-if="course.is_paid==true" ng-bind="course.price"
										class="">S$284</span> <!-- end ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
				</ul>
				<!-- end ngRepeat: n in range(numOfCourseList) --> <a
					href="All-Courses"
					class="skin-color link dn db-lg mt-10 mb20 bb1 pb5 ng-hide"
					ng-show="unit.url_filter"></a></course-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">Top Free
						Courses in Development</h2>
					<a href="all-courses?price=price-free"
						class="skin-color fxje fx link dn-lg" ng-show="unit.url_filter">Browse
						all</a> <a href="" ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<course-list-unit unit="unit">
				<ul class="fxjsb hidden-holder mb20 content-loader--card none"
					ng-class="{none: done}" done="cntl.courses">
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
					<li style="width: 216px; height: 214px" class="bg-white">
						<div class="content-loader__item h120"></div>
						<div class="p10">
							<div class="content-loader__item h10"></div>
							<div class="content-loader__item h10 mt5"></div>
							<div class="mt20 fxw">
								<div class="content-loader__item h10 fx mr30"></div>
								<div class="content-loader__item w50 h10"></div>
							</div>
						</div>
					</li>
				</ul>
				<!-- ngRepeat: n in range(numOfCourseList) -->
				<ul class="discover-courses-list channel-courses-list"
					ng-repeat="n in range(numOfCourseList)">
					<!-- ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small" data-courseid="149042" course="course"
						ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=149042"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/javascript-for-absolute-beginners/" class="mask"> <span
							class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">14 lectures</span></span> <span class="row-two" translate=""><span
										class="">2 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/149042_f114_4.jpg"
								alt="JavaScript for Absolute Beginners"
								src="https://udemy-images.udemy.com/course/480x270/149042_f114_4.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/214757_152e_9.jpg"
										alt="Stone River eLearning"
										src="https://udemy-images.udemy.com/user/50x50/214757_152e_9.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> JavaScript for
									Absolute Beginners </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Stone River eLearning <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Online Technology Bootcamp </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 81.875%;"></span>
								</span> <span translate=""><span class="">(32)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false --> <span
										ng-if="course.is_paid==false" translate="" class=""><span
											class="">Free</span></span> <!-- end ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small" data-courseid="746120" course="course"
						ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=746120"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/java-cryptography-architecture-hashing-and-secure-password/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">8 lectures</span></span> <span class="row-two" translate=""><span
										class="">1 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/746120_40eb.jpg"
								alt="Java Cryptography Architecture: Hashing and Secure Password"
								src="https://udemy-images.udemy.com/course/480x270/746120_40eb.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/18526066_eaaa_2.jpg"
										alt="Dipl.-Inform. Frank Hissen"
										src="https://udemy-images.udemy.com/user/50x50/18526066_eaaa_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Java Cryptography
									Architecture: Hashing and Secure Password </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Dipl.-Inform. Frank Hissen <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , Computer Scientist / IT security expert </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 0%;"></span>
								</span> <span translate=""><span class="">(0)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false --> <span
										ng-if="course.is_paid==false" translate="" class=""><span
											class="">Free</span></span> <!-- end ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
					<li class="course-box small" data-courseid="340844" course="course"
						ng-repeat="course in getCoursesSlice(n)"
						in-view="$inview&amp;&amp;cntl.markAsSeen(course)">
						<!-- ngIf: wishlist --> <span
						class="add-to-wishlist btn btn-sm ud-popup"
						data-requirelogin="true"
						data-signuppopupidentifier="button-wishlist" prevent-click=""
						initialize-ud-popup-on-event="preventwishlistclick"
						href="/wishlist/add?courseId=340844"
						ng-class="{'active': course.is_wishlisted}" ng-if="wishlist"
						ng-click="course.is_wishlisted ? removeCourseFromWishlist() :
				addCourseToWishlist()">
							<i class="icon-heart wish-icon"></i>
							<div class="tooltip left">
								<div class="tooltip-arrow"></div>
								<div class="tooltip-inner in-wishlist none" translate="">
									<span class="">Wishlisted</span>
								</div>
								<div class="tooltip-inner not-in-wishlist " translate="">
									<span class="">Wishlist</span>
								</div>
							</div>
					</span> <!-- end ngIf: wishlist --> <a
						href="/how-i-landed-a-web-development-job-earned-5k-freelancing/"
						class="mask"> <span class="course-thumb pos-r dib"> <span
								class="lec-info fxdc"> <span class="row-one" translate=""><span
										class="">62 lectures</span></span> <span class="row-two" translate=""><span
										class="">5 hours video</span></span>
							</span> <img
								ng-src="https://udemy-images.udemy.com/course/480x270/340844_bf64_2.jpg"
								alt="Learn HTML &amp; CSS: How To Start Your Web Development Career"
								src="https://udemy-images.udemy.com/course/480x270/340844_bf64_2.jpg">
								<span class="avatars-list"> <!-- ngIf: ::course.visible_instructors.length === 1 -->
									<span class="avatar"
									ng-if="::course.visible_instructors.length === 1"> <img
										ng-src="https://udemy-images.udemy.com/user/50x50/3576020_11ca_2.jpg"
										alt="Michael Bowen"
										src="https://udemy-images.udemy.com/user/50x50/3576020_11ca_2.jpg">
								</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
									<!-- ngIf: ::course.visible_instructors.length === 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
									<!-- ngIf: ::course.visible_instructors.length > 2 --> <!-- ngIf: ::course.visible_instructors.length > 2 -->
							</span>
						</span> <span class="box-second-row"> <span
								class="title ellipsis-2lines h34"> Learn HTML &amp; CSS:
									How To Start Your Web Development Career </span> <!-- ngIf: ::course.visible_instructors.length === 1 -->
								<span class="dib title ins-title ellipsis-2lines h34"
								ng-if="::course.visible_instructors.length === 1"
								style="display: block"> Michael Bowen <!-- ngIf: ::course.visible_instructors[0].job_title -->
									<span ng-if="::course.visible_instructors[0].job_title"
									class=""> , 5+ Years In Front End Web Development &amp;
										Local SEO Marketing </span> <!-- end ngIf: ::course.visible_instructors[0].job_title -->
							</span> <!-- end ngIf: ::course.visible_instructors.length === 1 --> <!-- ngIf: ::course.visible_instructors.length === 2 -->
								<!-- ngIf: course.visible_instructors.length > 2 --> <span
								class="reviews-row db p5-10 fxw"> <span
									class="s-rating smaller static maroon"> <span
										ng-style="{width: (course.avg_rating * 20) + '%'}"
										style="width: 100%;"></span>
								</span> <span translate=""><span class="">(8)</span></span>
							</span> <span class="price-wrap fxac mh36"> <!-- ngIf: course.promotion_price -->
									<span class="price skin-color"> <!-- ngIf: course.is_paid==true -->
										<!-- ngIf: course.is_paid==false --> <span
										ng-if="course.is_paid==false" translate="" class=""><span
											class="">Free</span></span> <!-- end ngIf: course.is_paid==false -->
								</span>

							</span>
						</span>

					</a>
					</li>
					<!-- end ngRepeat: course in getCoursesSlice(n) -->
				</ul>
				<!-- end ngRepeat: n in range(numOfCourseList) --> <a
					href="All-Courses?price=price-free"
					class="skin-color link dn db-lg mt-10 mb20 bb1 pb5"
					ng-show="unit.url_filter">Browse all</a></course-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
				<discovery-unit-container ng-show="unit.isEnabled"
					ng-repeat="unit in channelPage
				.units" unit="unit" class="">
				<div class="fxw fxdc-xs" in-view-container="">
					<h2 ng-bind-html="trustedUnitTitle | translate">Related Topics</h2>
					<a href="all-courses" class="skin-color fxje fx link dn-lg ng-hide"
						ng-show="unit.url_filter"></a> <a href=""
						ng-click="viewAllClicked()"
						class="collapse-btn btn view-all ng-hide"
						ng-show="viewAllButtonIsEnabled"> View All <i
						class="icon-plus-sign"></i>
					</a> <a href="" ng-click="collapseClicked()"
						class="collapse-btn btn collapse-selector ng-hide"
						ng-show="collapseButtonIsEnabled"> Collapse <i
						class="icon-minus-sign"></i>
					</a>
					<div class="nav-container ng-hide" ng-show="viewAllButtonIsEnabled">
						<button ng-click="goToPrevious()"
							class="course-nav-btn prev btn btn-default"
							ng-disabled="!prevButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-left"></i>
						</button>
						<button ng-click="goToNext()"
							class="course-nav-btn next btn btn-default"
							ng-disabled="!nextButtonIsEnabled" disabled="disabled">
							<i class="icon-chevron-right"></i>
						</button>
					</div>
				</div>
				<channel-list-unit unit="unit">
				<ul class="related-topics fxjsb mb25 fxc-xs db-force-xs">
					<!-- ngRepeat: channel in channelList | limitTo:5 -->
					<li class="m0-5-sm mb10-xs w110-force-xs m0-5-lg" channel="channel"
						ng-repeat="channel in channelList | limitTo:5"><a
						href="/courses/design/" class="skin-color"> <span
							class="sim-icons"><span class="ud_design_big"></span></span> <span
							class="sim-title fs13-xs">Design</span>
					</a></li>
					<!-- end ngRepeat: channel in channelList | limitTo:5 -->
					<li class="m0-5-sm mb10-xs w110-force-xs m0-5-lg" channel="channel"
						ng-repeat="channel in channelList | limitTo:5"><a
						href="/courses/it-and-software/" class="skin-color"> <span
							class="sim-icons"><span class="ud_it-and-software_big"></span></span>
							<span class="sim-title fs13-xs">IT &amp; Software</span>
					</a></li>
					<!-- end ngRepeat: channel in channelList | limitTo:5 -->
					<li class="m0-5-sm mb10-xs w110-force-xs m0-5-lg" channel="channel"
						ng-repeat="channel in channelList | limitTo:5"><a
						href="/courses/business/" class="skin-color"> <span
							class="sim-icons"><span class="ud_business_big"></span></span> <span
							class="sim-title fs13-xs">Business</span>
					</a></li>
					<!-- end ngRepeat: channel in channelList | limitTo:5 -->
					<li class="m0-5-sm mb10-xs w110-force-xs m0-5-lg" channel="channel"
						ng-repeat="channel in channelList | limitTo:5"><a
						href="/courses/office-productivity/" class="skin-color"> <span
							class="sim-icons"><span class="ud_office-productivity_big"></span></span>
							<span class="sim-title fs13-xs">Office Productivity</span>
					</a></li>
					<!-- end ngRepeat: channel in channelList | limitTo:5 -->
					<li class="m0-5-sm mb10-xs w110-force-xs m0-5-lg" channel="channel"
						ng-repeat="channel in channelList | limitTo:5"><a
						href="/courses/marketing/" class="skin-color"> <span
							class="sim-icons"><span class="ud_marketing_big"></span></span> <span
							class="sim-title fs13-xs">Marketing</span>
					</a></li>
					<!-- end ngRepeat: channel in channelList | limitTo:5 -->
				</ul>
				</channel-list-unit></discovery-unit-container>
				<!-- end ngRepeat: unit in channelPage
				.units -->
			</div>
		</div>
	</div>


	<div class="modal fade filter-modal" id="subcats-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<!-- ngIf: channelPage.showRelatedTopics() -->
					<!-- ngIf: channelPage.showMoreInChannel() -->
					<span ng-if="channelPage.showMoreInChannel()" class="">More
						in Development</span>
					<!-- end ngIf: channelPage.showMoreInChannel() -->
				</div>
				<div class="modal-body p10-15">
					<!-- ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/web-development/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_web-development"></span></span> <span
								class="chan-title fw6 fs13">Web Development</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a href="/courses/development/mobile-apps/"
							target="_self" class="skin-color"> <span class="chan-icon"><span
									class="ud_mobile-apps"></span></span> <span
								class="chan-title fw6 fs13">Mobile Apps</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/programming-languages/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_programming-languages"></span></span> <span
								class="chan-title fw6 fs13">Programming Languages</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/game-development/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_game-development"></span></span> <span
								class="chan-title fw6 fs13">Game Development</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a href="/courses/development/databases/"
							target="_self" class="skin-color"> <span class="chan-icon"><span
									class="ud_databases"></span></span> <span class="chan-title fw6 fs13">Databases</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/software-testing/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_software-testing"></span></span> <span
								class="chan-title fw6 fs13">Software Testing</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/software-engineering/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_software-engineering"></span></span> <span
								class="chan-title fw6 fs13">Software Engineering</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a href="/courses/development/e-commerce/"
							target="_self" class="skin-color"> <span class="chan-icon"><span
									class="ud_e-commerce"></span></span> <span class="chan-title fw6 fs13">E-Commerce</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
					<ul ng-repeat="channel in channelPage.relatedChannels" class="">
						<li class="mb10"><a
							href="/courses/development/development-tools/" target="_self"
							class="skin-color"> <span class="chan-icon"><span
									class="ud_development-tools"></span></span> <span
								class="chan-title fw6 fs13">Development Tools</span>
						</a></li>
					</ul>
					<!-- end ngRepeat: channel in channelPage.relatedChannels -->
				</div>
			</div>
		</div>
	</div>
</div>
