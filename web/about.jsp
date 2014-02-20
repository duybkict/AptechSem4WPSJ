<%--
    Document   : about
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="About Us | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="about" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div>
						<h3>A few words about us</h3>
						<p>
							<strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </strong><br />
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse fermentum ipsum vel ligula condimentum, a facilisis nisl adipiscing. Phasellus dui elit, porttitor in pulvinar porta, congue varius risus. Morbi non lorem lobortis, cursus lorem ac, tempor lectus. Sed hendrerit vehicula sollicitudin. Vivamus porta eu justo fringilla feugiat. Sed in leo mauris. Donec tincidunt magna mauris, nec elementum orci pulvinar commodo. Sed dictum, elit sed volutpat semper.
						</p>
						<img src="images/page2-img1.jpg" alt="" class="pull-left img-thumbnail" style="margin-right: 20px;"/>
						<p>
							<strong>Proin tincidunt vulputate ultricies. Curabitur iaculis dignissim laoreet. Morbi sed risus sodales.</strong><br/>
							Phasellus eu nisi ligula. Ut imperdiet erat vitae velit interdum lobortis. Duis eu tortor lobortis justo viverra sagittis. Vestibulum at hendrerit diam. Aenean et justo nec nunc blandit congue. Ut ultricies convallis orci sed fringilla.
						</p>
					</div>

					<div class="clearfix"></div>

					<div class="bg padding about-bg-row">
						<h3>Why choose us</h3>
						<p>
							<strong>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias.</strong><br />
							Excepturi sint occaecati <a href="contacts.jsp">get to us</a>, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio.
						</p>
						<br />
						<div class="clearfix">
							<div class="col-xs-6">
								<ul class="list-arrow">
									<li>Lorem ipsum dolor amet consectetur</li>
									<li>Adipisicing eldo eiusmd tempor incididunt</li>
									<li>Labore et dolore magna aliqua</li>
									<li>Ut enim ad minim veniam, quis nostrud</li>
								</ul>
							</div>
							<div class="col-xs-6">
								<ul class="list-arrow">
									<li>Exercitation ullamco laboris nisi ut aliquip</li>
									<li>Duis aute irure dolor reprehenderit</li>
									<li>Voluptate vejlit esse cillum dolore eu fugiat</li>
									<li>Excepteur sint occaecat cupidatat non</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>Testimonials</h3>
					<hr />

					<blockquote>&quot;Sed ut perspiciatis unde omnis iste doloremque laudantium, totam rem aperiam, eaque ipsa quae&quot;</blockquote>
					<div class="text-right">
						<strong class="text-orange">Jane Bane</strong>
					</div>
					<br/>

					<blockquote>&quot;Abillo inventore veritatis et quasi archi tationem ullam corporis suscipit laborio tecto beatae vitae dicta sunt explicabo.&quot;</blockquote>
					<div class="text-right">
						<strong class="text-orange">William Hampton</strong>
					</div>
					<br/>

					<blockquote>&quot;Aut odit aut fugit, sed quia conse quuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem&quot;</blockquote>
					<div class="text-right">
						<strong class="text-orange">Harry Wallet</strong>
					</div>
					<br/>

					<blockquote>&quot;Ipsum quia dolor sit amet, con sectetur, adipisci velit, sed quia non numquam ad minima veniam, quis nostrum exercieius modi tempora incidunt ut labore et dolore magnam&quot;</blockquote>
					<div class="text-right">
						<strong class="text-orange">Dominic Paulo</strong>
					</div>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
