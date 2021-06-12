<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Hans Clausen, Gerlinde Schneider, Martina Scholger, Christian Steiner, Elisabeth Steiner, Sebastian Stoff
    Last update: 2020 (Update gamsJS)
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:lido="http://www.lido-schema.org"
	xmlns:bibtex="http://bibtexml.sf.net/" exclude-result-prefixes="#all">

	<!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>-->

	<!-- häufig verwendete variablen... -->

	<xsl:param name="mode"/>
	<xsl:param name="search"/>

	<xsl:variable name="model"
		select="substring-after(/s:sparql/s:results/s:result/s:model/@uri, '/')"/>

	<xsl:variable name="cid">
		<!-- das ist der pid des contextes, kommt aus dem sparql (ggfs. query anpassen) - wenn keine objekte zugeordnet sind, gibt es ihn nicht! -->
		<xsl:value-of select="/s:sparql/s:results/s:result[1]/s:cid"/>
	</xsl:variable>

	<xsl:variable name="teipid">
		<xsl:value-of select="//t:idno[@type = 'PID']"/>
	</xsl:variable>

	<xsl:variable name="lidopid">
		<xsl:value-of select="//lido:lidoRecID"/>
	</xsl:variable>

	<!--variablen für Suchergebnisse-->
	<xsl:variable name="query" select="sparql/head/query"/>
	<xsl:variable name="hitTotal" select="/sparql/head/hitTotal"/>
	<xsl:variable name="hitPageStart" select="/sparql/head/hitPageStart"/>
	<xsl:variable name="hitPageSize" select="/sparql/head/hitPageSize"/>
	<xsl:variable name="hitsFrom" select="sparql/navigation/hits/from"/>
	<xsl:variable name="hitsTo" select="sparql/navigation/hits/to"/>

	<!-- GAMS global variables -->
	<xsl:variable name="zim">Zentrum für Informationsmodellierung - Austrian Centre for Digital
		Humanities</xsl:variable>
	<xsl:variable name="zim-acdh">ZIM-ACDH</xsl:variable>
	<xsl:variable name="gams">Geisteswissenschaftliches Asset Management System</xsl:variable>
	<xsl:variable name="uniGraz">Universität Graz</xsl:variable>

	<!-- project-specific variables -->
	<!-- Replace with public server (e.g. https://raw.githubusercontent.com/GVogeler/TerpincLetters/main/ ) to test online version -->
	<xsl:variable name="gamsdev">.</xsl:variable>
	<!-- project abbreviation -->
	<xsl:variable name="projectID">trpcl</xsl:variable>
	
	<xsl:variable name="projectTitle">
		<xsl:text>GAMS - Project Title</xsl:text>
	</xsl:variable>
	<xsl:variable name="subTitle">
		<xsl:text>Subtitle</xsl:text>
	</xsl:variable>

	<!-- gesamtes css ist in dieser Datei zusammengefasst mit Ausnahme der Navigation -->
	<xsl:variable name="projectCss">
		<xsl:value-of select="concat($gamsdev, '/css/template.css')"/>
	</xsl:variable>
	<!--css für die navigation-->
	<xsl:variable name="projectNav">
		<xsl:value-of select="concat($gamsdev, '/css/navbar.css')"/>
	</xsl:variable>

	<!--xsl für die suchansicht-->
	<xsl:variable name="searchXsl">
		<xsl:value-of select="concat($gamsdev, '/project-search.xsl')"
		/>
	</xsl:variable>
	
	<!-- GamsJs related templates -->
	<xsl:include href="./lib/3.0/gamsJS/1.x/gamsjs_wippets/widget_injection.xsl"/>

	<xsl:template match="/">

		<html lang="de">
			<head>
				<meta charset="utf-8"/>
				
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
				<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

				<meta name="description" content=""/>
				<!-- Projektbeschreibung eingeben -->
				<!-- evtl. noch mehr Meta Tags aus Dublin Core, schema.org oder Open Graph -->

				<meta name="publisher"
					content="Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities"/>
				<meta name="content-language" content="de"/>

				<!--Projekttitel-->
				<title>
					<xsl:value-of select="$projectTitle"/>
				</title>

				<!-- Bootstrap core CSS -->
				<link href="./lib/2.0/bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet"/>
				
				<!-- extra lib für icons, optimiert für bootstrap
				link: https://useiconic.com/open/
				einbindung zB: <span class="oi oi-magnifying-glass"><xsl:text> </xsl:text></span> -->
				<link href="./lib/2.0/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet"/>
					

				<!-- Custom styles for this template -->
				<link href="{$projectCss}" rel="stylesheet" type="text/css"/>
				<link href="{$projectNav}" rel="stylesheet" type="text/css"/>

				<!-- jQuery core JavaScript ================================================== -->
				<script type="text/javascript" src="./lib/2.0/jquery-3.5.1.min.js"><xsl:text> </xsl:text></script>

				<!-- Bootstrap core JavaScript ================================================== -->
				<script type="text/javascript" src="./lib/2.0/bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js"><xsl:text> </xsl:text></script>

				<!-- 
					GamsJs inclusion  
					- call gamsJs wippets (included in project-static.xsl - see above)
					- stable = continouus integrated version is available under lib folder.
					- experimental version (with newer features is under gamsdev/stoffse/test/gams.js - see commented link down below.
						- (bug fixes / will first be deployed to gamsdev folder)
				-->
				
				<script src="./lib/3.0/gamsJS/1.x/gams.js" type="text/javascript"><xsl:text> </xsl:text></script>
				<!--<script src="https://glossa.uni-graz.at/gamsdev/stoffse/test/gams.js"><xsl:text> </xsl:text></script>-->

			</head>

			<body>

				<header>
					<div class="container">
						<div class="row flex">
							<div class="col-10">
								<h1>
									<xsl:value-of select="$projectTitle"/>
								</h1>
								<h2>
									<xsl:value-of select="$subTitle"/>
								</h2>
							</div>
							<div class="col-2">
								<!-- 1 statt 4 -->
								<div class="unilogo">
									<div class="language">
										<a href="#">DE</a> | <a href="#">EN</a>
									</div>
									<a href="http://www.uni-graz.at" class="unilogo" target="_blank">
										<img class="logoUni"
											src="./templates/img/logo_uni_graz_4c.jpg"
											height="62" title="Universität Graz"
											alt="Universität Graz"/>
									</a>
								</div>
							</div>
						</div>
					</div>
				</header>

				<nav class="navbar navbar-expand-md navbar-dark sticky-top">
					<div class="container">
						<a class="navbar-brand d-md-none" href="#">Navigation</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse"
							data-target="#navbarCollapse" aria-controls="navbarCollapse"
							aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"><xsl:text> </xsl:text></span>
						</button>
						<div id="navbarCollapse" class="collapse navbar-collapse">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item">
									<xsl:if test="$mode = '' and $cid=concat('context:',$projectID)">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/context:{$projectID}"
										>Home <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item">
									<xsl:if test="$mode = 'about'">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=project"
										>Projektbeschreibung</a>
								</li>
								<li class="nav-item">
									<xsl:if test="$mode = concat('context:',$projectID)">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=context:{$projectID}"
										>Sammlung</a>
								</li>
								<li class="nav-item">
									<xsl:if test="$mode = 'search' or $search = 'advanced'">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=search"
										>Erweiterte Suche</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown" title="examples for wippets and other features or methods from gamsJS"> Feature List </a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/o:templates.editionexample/sdef:TEI/get?mode=view:editionobject" title="an example for a digital edition object with the scrollable edition viewer (example TEI taken from the project corema)">Edition Object w/ Viewer</a>
										<a class="dropdown-item" href="/o:templates.editionexample/sdef:TEI/get?mode=view:otherobject" title="an example for an other type of object e.g. artefacts and metadata with the non-scrollable osd (open sea dragon) viewer">Other Object w/ Viewer</a>
										<a class="dropdown-item" href="#">Sticky nav and jumping points fix</a>
										<a class="dropdown-item" href="http://glossa.uni-graz.at/query:yoda.fulltext-test">Widget Blazegraph full text search in properties with literals as range</a>
										<a class="dropdown-item" href="/o:templates.editionexample/sdef:TEI/get?mode=queryform" title="Das Wippet enthät ein Formular, in dem alle üblichen Formularfelder in $[0-9]+ umgewandelt werden, um dann als Platzhalter in Query-Objekten eingesetzt werden zu können.">Query Form Example</a>
										<a class="dropdown-item" href="http://gams.uni-graz.at/archive/objects/context:gg/methods/sdef:Context/get?mode=project" title="example for a bootstrap carousel">Carousel</a>
									</div>
								</li>
								<li class="nav-item">
									<xsl:if test="$mode = 'view:gamsJs'">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=view:gamsJs"
										>gamsJs</a>
									
									<!--<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown" title="examples for wippets and other features or methods from gamsJS">gamsJs</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/o:templates5.tripleform/sdef:TEI/get?mode=view:tripleform" title="an example for a digital edition object with the scrollable edition viewer (example TEI taken from the project corema)">TripleForm</a>
										<!-\-<a class="dropdown-item" href="/o:templates5.tripleform/sdef:TEI/get?mode=view:gdasmapp" title="an example for a digital edition object with the scrollable edition viewer (example TEI taken from the project corema)">Gdas MApp</a>-\->
									</div>-->
								</li>
							</ul>
							<form class="form-inline" role="search" method="get"
								action="/search/gsearch">
								<div class="input-group">
									<input class="form-control" type="search"  id="query" name="query" 
										placeholder="Volltextsuche" aria-label="Search"/>
<!--									<div class="input-group-append">-->
									<button class="btn btn-outline-light" type="submit" 
											><span class="oi oi-magnifying-glass"><xsl:text> </xsl:text></span>
											<span class="sr-only">Volltextsuche</span>
										</button>
									<!--</div>-->
									
									
									
									<input type="hidden" name="hitPageSize" value="10"/>
								<input type="hidden" name="hitPageStart" value="1"/>
								<input type="hidden" name="pid" value="fercan"/>
								<!--<input type="hidden" name="search" value="simple"/>--><!-- nur zur abgrenzung verwenden wenn man auch advanced hat -->
									<input type="hidden" name="x2" value="http://glossa.uni-graz.at/gamsdev/steineel/frontend-templates/trunk/templates5/project-search.xsl">
									<!--<xsl:attribute name="value">
										<xsl:value-of select="$searchXsl"/>
									</xsl:attribute>-->
								</input>
								</div>
							</form>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container -->
				</nav>

				
				<main class="container">
					<xsl:choose>
						<xsl:when test="$mode = '' and $cid = concat('context:',$projectID)">
							<!-- einstiegsseite für projektkontext -->


							<section class="row">
								<article class="col-md-5">
									<div class="card" data-mh="group1">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Lorem Ipsum</h3>
												<h4>Lorem Ipsum dolor sit amet</h4>
												<p> Lorem ipsum dolor sit amet, consetetur
												sadipscing elitr, sed diam nonumy eirmod tempor
												invidunt ut labore et dolore magna aliquyam erat,
												sed diam voluptua. At vero eos et accusam et justo
												duo dolores et ea rebum. Stet clita kasd
												gubergren, no sea takimata sanctus est Lorem ipsum
												dolor sit amet. </p>
												<p> Duis autem vel eum iriure dolor in hendrerit in
												vulputate velit esse molestie consequat, vel illum
												dolore eu feugiat nulla facilisis at vero eros et
												accumsan et iusto odio dignissim qui blandit
												praesent luptatum zzril delenit augue duis dolore
												te feugait nulla facilisi. Lorem ipsum dolor sit
												amet, consectetuer adipiscing elit, sed diam
												nonummy nibh euismod tincidunt ut laoreet dolore
												magna aliquam erat volutpat. </p>
											</blockquote>
										</div>
									</div>


								</article>
								<article class="col-md-4">
									<div class="card" data-mh="group1">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Lorem Ipsum</h3>
												<h4>Lorem Ipsum dolor sit amet</h4>
												<p> Lorem ipsum dolor sit amet, consetetur
												sadipscing elitr, sed diam nonumy eirmod tempor
												invidunt ut labore et dolore magna aliquyam erat,
												sed diam voluptua. At vero eos et accusam et justo
												duo dolores et ea rebum. Stet clita kasd
												gubergren, no sea takimata sanctus est Lorem ipsum
												dolor sit amet. Lorem ipsum dolor sit amet,
												consetetur sadipscing elitr, sed diam nonumy
												eirmod tempor invidunt ut labore et dolore magna
												aliquyam erat, sed diam voluptua. At vero eos et
												accusam et justo duo dolores et ea rebum. Stet
												clita kasd gubergren, no sea takimata sanctus est
												Lorem ipsum dolor sit amet. Lorem ipsum dolor sit
												amet, consetetur sadipscing elitr, sed diam nonumy
												eirmod tempor invidunt ut labore et dolore magna
												aliquyam erat, sed diam voluptua. At vero eos et
												accusam et justo duo dolores et ea rebum. Stet
												clita kasd gubergren, no sea takimata sanctus est
												Lorem ipsum dolor sit amet. </p>
											</blockquote>
										</div>
									</div>


								</article>
								<article class="col-md-3">
									<!-- card mit image verbessern -->

									<div class="card">
										<img class="card-img-top" src="/templates/img/4-esel.jpg"
											alt="Card image cap"/>
										<div class="card-body">
											<h4 class="card-title">Card title</h4>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's
												content.</p>
											<a href="#!" class="btn btn-dark">Go somewhere</a>
										</div>
									</div>


								</article>
							</section>

							<section class="row">
								<article class="col-md-10">
									<div class="card" data-mh="group2">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<p>Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Integer posuere erat a ante.</p>

											</blockquote>
										</div>
									</div>


								</article>
								<article class="col-md-2">
									<div class="card" data-mh="group2">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<p>Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Integer posuere erat a ante.</p>

											</blockquote>
										</div>
									</div>


								</article>
							</section>



							<section class="row">
								<article class="col-md-6">
									<div class="card" data-mh="group3">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Tester</h3>
												<h4>Testo</h4>
												<p>Testi</p>

											</blockquote>
										</div>
									</div>


								</article>
								<article class="col-md-6">
									<!-- carousel und card einbauen -->

									<div class="card" data-mh="group3">

										<div id="carouselExampleIndicators" class="carousel slide"
											data-ride="carousel">
											<ol class="carousel-indicators">
												<li data-target="#carouselExampleIndicators"
												data-slide-to="0" class="active"/>
												<li data-target="#carouselExampleIndicators"
												data-slide-to="1"/>
											</ol>
											<div class="carousel-inner" role="listbox">
												<div class="carousel-item active">
												<img class="d-block w-100"
												src="/templates/img/4-esel.jpg"
												data-src="holder.js/900x400?theme=social"
												alt="First slide"/>
												</div>
												<div class="carousel-item">
												<img class="d-block w-100"
												src="/templates/img/4-esel.jpg"
												data-src="holder.js/900x400?theme=industrial"
												alt="Second slide"/>
												</div>
											</div>
											<a class="carousel-control-prev"
												href="#carouselExampleIndicators" role="button"
												data-slide="prev">
												<span class="carousel-control-prev-icon"
												aria-hidden="true"/>
												<span class="sr-only">Previous</span>
											</a>
											<a class="carousel-control-next"
												href="#carouselExampleIndicators" role="button"
												data-slide="next">
												<span class="carousel-control-next-icon"
												aria-hidden="true"/>
												<span class="sr-only">Next</span>
											</a>
										</div>



										<div class="card-body">
											<h4 class="card-title">Card title</h4>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's
												content.</p>
											<a href="#!" class="btn btn-dark">Go somewhere</a>
										</div>

									</div>


									<!-- 	<div class="panel panel-with-image" data-mh="group3">

										<!-/-Snippet für Bilder-Karussel; Typ: Slideshow.
									
																	
									
									Fragen bitte an Hans Clausen; Doku unter: http://getbootstrap.com/javascript/#carousel; W3school unter: http://www.w3schools.com/bootstrap/bootstrap_carousel.asp. 
									
									Hinweis: Achtet darauf, dass die Bilder alle die gleichen Maße haben und die Bild-Box komplett ausfüllen.
						            
									
									Optionen:
									
									- Dauer der Anzeige: Um die Dauer der Anzeige der einzelnen Bilder einzustellen, folgendes Attribut dem untenstehenden Element <div id="carousel-axample-generic"> hinzufügen: data-intervall="". 
									Als Wert wird die Dauer der Anzeige in Millisekunden angegeben. Z.B.: data-intervall="3000" sind 3 Sekunden Anzeigendauer. Der default sind 5000 Millisekunden.
									
									- Anzahl der Durchläufe: Es gibt die Möglichkeit, die Slideshow nach einem Durchlauf stoppen zu lassen, sodass die Anzeige beim letzten Bild verharrt. 
									Für diesen Effekt dem untenstehenden Element <div id="carousel-axample-generic"> das Attribut data-wrap="" hinzufügen. 
									Der Wert "false" aktiviert den Stopp nach einem Durchlauf, der Wert "true" deaktiviert diese Funktion.
									
								-/->
										<div class="panel-image">
											<div id="carousel-example-generic"
												class="carousel slide" data-ride="carousel">

												<!-/- Indicators: Stellt die Position des aktuellen Bildes visuell dar (Bullets). Muss an die Anzahl der Bilder angepasst werden. Kann bei Bedarf gelöscht werden. -/->
												<ol class="carousel-indicators">
												<li data-target="#carousel-example-generic"
												data-slide-to="0" class="active"/>
												<li data-target="#carousel-example-generic"
												data-slide-to="1"/>
												<li data-target="#carousel-example-generic"
												data-slide-to="2"/>
												<li data-target="#carousel-example-generic"
												data-slide-to="3"/>
												</ol>

												<!-/- Wrapper for slides: Die gewünschten Bilder in den untenstehenden Elementen <img> angeben. 
										Anzahl der der Elemente <div class="item"> (Achtung: Nur erstes Element erhält auch Klasse class="active"!) an die gewünschte Anzahl von Bildern anpassen. 
									Im Element <div class="carousel-caption"> Können mögliche Bildbeschriftungen angegeben werden. Wenn nicht erwünscht, Element <div class="carousel-caption"> einfach löschen.
									
												<div class="carousel-inner" role="listbox">


												<div class="item active">
												<!-/- Wenn die Bilder auf ein Objekt usw. verlinken sollen, einfach ein Element <a> um das entsprechende Element <img> bauen.  -/->
												<img
												src="/templates/img/4-esel.jpg"
												alt="..."/>
												<div class="carousel-caption"> Projekt 1 </div>
												</div>


												<div class="item">
												<img
												src="/templates/img/4-esel.jpg"
												alt="..."/>
												<div class="carousel-caption"> Projekt 2 </div>
												</div>
												<div class="item">
												<img
												src="/templates/img/4-esel.jpg"
												alt="..."/>
												<div class="carousel-caption"> Projekt 3 </div>
												</div>
												<div class="item">
												<img
												src="/templates/img/4-esel.jpg"
												alt="..."/>
												<div class="carousel-caption"> Projekt 4 </div>
												</div>

												</div>

												<!-/- Controls -/->
												<a class="left carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="prev">
												<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" xml:space="preserve"> </span>
												<span class="sr-only">Previous</span>
												</a>
												<a class="right carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="next">
												<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" xml:space="preserve"> </span>
												<span class="sr-only">Next</span>
												</a>
											</div>

										</div>
										<div class="panel-body">
											<h4>Hugo von Monfort Edition<a href="#more"><span
												class="glyphicon glyphicon-chevron-down"/></a></h4>

										</div>
									</div>-->
								</article>
							</section>


						</xsl:when>
						<xsl:when test="$mode = 'imprint'">
							<!-- impressum, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-12">
									<div class="card mb-3 text-center border-dark">
										<div class="card-body">
											<xsl:apply-templates
												select="document(concat('/context:', $projectID,'/', 'IMPRINT'))/t:TEI/t:text/t:body/t:div"
											/>
										</div>
									</div>
								</article>
							</section>

						</xsl:when>
						<xsl:when test="$mode = 'searchHelp'">
							<!-- Hilfe für die Suche, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-12">
									<div class="card">
										<div class="card-body">
											<xsl:apply-templates
												select="document(concat('/context:', $projectID,'/', 'SEARCH_HELP'))/t:TEI/t:text/t:body/t:div"
											/>
										</div>
									</div>
								</article>
							</section>

						</xsl:when>

						<xsl:when test="$mode = 'project'">
							<section class="row">
								<article class="col-md-12">
									<div class="card" data-mh="group1">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Project Description</h3>
												
												<p> Lorem ipsum dolor sit amet, consetetur
												sadipscing elitr, sed diam nonumy eirmod tempor
												invidunt ut labore et dolore magna aliquyam erat,
												sed diam voluptua. At vero eos et accusam et justo
												duo dolores et ea rebum. Stet clita kasd
												gubergren, no sea takimata sanctus est Lorem ipsum
												dolor sit amet. </p>
												<p> Duis autem vel eum iriure dolor in hendrerit in
												vulputate velit esse molestie consequat, vel illum
												dolore eu feugiat nulla facilisis at vero eros et
												accumsan et iusto odio dignissim qui blandit
												praesent luptatum zzril delenit augue duis dolore
												te feugait nulla facilisi. Lorem ipsum dolor sit
												amet, consectetuer adipiscing elit, sed diam
												nonummy nibh euismod tincidunt ut laoreet dolore
												magna aliquam erat volutpat. </p>
											</blockquote>
										</div>
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'about'">
						<section class="row">
							<article class="col-md-12">
								<div class="card">
									<div class="card-body">
										<xsl:apply-templates
											select="document(concat('/context:', $projectID,'/', 'ABOUT'))/t:TEI/t:text/t:body/t:div"
										/>
									</div>
								</div>
							</article>
						</section>
						</xsl:when>

						<xsl:when test="$mode = 'search'">
							<!-- muss auch im project-search kopiert werden, damit die felderbox auch bei den ergebnissen stehen bleibt. wenn ein projekt keine erweiterte suche hat, kann man das ignorieren -->

							<section class="row">
								<article class="col-md-5">
									<div class="card">
										<div class="card-body">
											<div class="advancedSearch">
												<h3>Erweiterte Suche</h3>
												<div id="backStart">
												<form method="get" name="g3search" role="form"
												action="/search/gsearch">
												<!-- ////////////////////// -->
												<div class="input-group form-group">
												<input type="text" class="form-control"
												placeholder="Volltextsuche" id="query2"
												name="query"/>
												<div class="input-group-append">
												<span class="input-group-text" id="basic-addon">
												<a
												href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=searchHelp"
												>?</a>
												</span>
												</div>
												</div>
												<!-- ////////////////////// -->
												<div class="form-group">
												<label for="exampleSelect1">Example select</label>
												<select class="form-control" id="exampleSelect1">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												</select>
												</div>
												<!-- ////////////////////// -->
												<div class="form-group">
												<label for="exampleSelect2">Mutiple select list
												(hold shift to select more than one):</label>
												<select multiple="multiple" class="form-control"
												id="sel2" name="sellist2">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												</select>
												</div>
												<!-- ////////////////////// -->
												<div class="form-group">
												<label for="exampleTextarea">Example
												textarea</label>
												<textarea class="form-control"
												id="exampleTextarea" rows="3">
												<xsl:text> </xsl:text>
												</textarea>
												</div>
												<fieldset class="form-group">
												<legend>Radio buttons</legend>
												<div class="form-check">
												<label class="form-check-label">
												<input type="radio" class="form-check-input"
												name="optionsRadios" id="optionsRadios1"
												value="option1"/> 1 </label>
												</div>
												<div class="form-check">
												<label class="form-check-label">
												<input type="radio" class="form-check-input"
												name="optionsRadios" id="optionsRadios2"
												value="option2"/> 2 </label>
												</div>
												<div class="form-check disabled">
												<label class="form-check-label">
												<input type="radio" class="form-check-input"
												name="optionsRadios" id="optionsRadios3"
												value="option3"/> 3 </label>
												</div>
												</fieldset>
												<div class="form-group">

												<button type="submit" class="btn btn-default"
												>Suche</button>
												<xsl:text> </xsl:text>
												<button type="reset" class="btn btn-default"
												>Zurücksetzen</button>
												</div>

												<input type="hidden" name="hitPageSize"
												id="hitPageSize" value="10"/>
												<input type="hidden" name="hitPageStart"
												id="hitPageStart" value="1"/>
												<input type="hidden" id="pid" name="pid"
												value="epsg"/>
												<input type="hidden" id="mode" value="search"/>
												<input type="hidden" name="search"
												value="advanced"/>
												<input type="hidden" name="x2">
												<xsl:attribute name="value">
												<xsl:value-of select="$searchXsl"/>
												</xsl:attribute>
												</input>

												</form>


												<!--<form method="get" name="g3search" role="form" action="/search/gsearch">
												

												<div class="form-group">
												<div class="input-group">
												<input type="text" class="form-control"
												placeholder="Volltextsuche" id="query2"
												name="query"/>
												<span class="input-group-addon">
												<a
												href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=searchHelp"
												>?</a>
												</span>
												</div>
												</div>
												<div class="form-group">
												<label for="selectbasic">Select Basic</label>

												<select id="selectbasic" name="selectbasic"
												class="form-control">
												<option value="1">Option one</option>
												<option value="2">Option two</option>
												</select>

												</div>
												<div class="form-group">
												<label for="selectbasic">Select Multiple</label>
												<select multiple="" class="form-control">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												</select>
												</div>
													
													
												<div class="form-group">

												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio1" value="option1"/> 1 </label>
												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio2" value="option2"/> 2 </label>
												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio3" value="option3"/> 3 </label>
												</div>
													
													
													
												<div class="form-group">

												<button type="submit" class="btn btn-default"
												>Suche</button>
												<xsl:text> </xsl:text>
												<button type="reset" class="btn btn-default"
												>Zurücksetzen</button>
												</div>

												<input type="hidden" name="hitPageSize"
												id="hitPageSize" value="10"/>
												<input type="hidden" name="hitPageStart"
												id="hitPageStart" value="1"/>
												<input type="hidden" id="pid" name="pid"
												value="epsg"/>
												<input type="hidden" id="mode" value="search"/>
												<input type="hidden" name="search"
												value="advanced"/>
												<input type="hidden" name="x2">
												<xsl:attribute name="value">
												<xsl:value-of select="$searchXsl"/>
												</xsl:attribute>
												</input>
												</form>-->
												</div>
											</div>
										</div>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode='view:gamsJs'">
							<br><xsl:text> </xsl:text></br>
							<h1>GamsJs</h1>
							
							<p>Features provided by gamsJs:</p>
							<ul>
								<li>Adjust viewport position when navigation is fixed (take a look at the gamsJs API description)</li>
								<li>Build GAMS conform urls via the GAMSUrl class (e.g. for correct queries)</li>
								<li>Imperative utility functions</li>
								<li>Code snippets to simplify code by convention and reuse</li>
							</ul>
							
							<h2>Links</h2>
							<ul>
								<li>
									<a href="https://zimfrontendcoordination.github.io/zimFrontendDocuClient/#/idols">Examples / Idols / Reference Implementations</a>
								</li>
								<li>
									<a href="https://zimfrontendcoordination.github.io/zimFrontendDocuClient/#/gamsJs">General API description for gamsJS</a>
								</li>
								<li>
									<a href="https://zimfrontendcoordination.github.io/zimFrontendDocuClient/#/gamsjswippets">gamsJs related wippets</a>
								</li>
								<li>
									<a href="https://zimfrontendcoordination.github.io/zimFrontendDocuClient/#/">Frontend Devtools Home</a>
								</li>
							</ul>
							
							
							
							
						</xsl:when>

						<xsl:otherwise>
							<xsl:call-template name="content"/>
						</xsl:otherwise>
					</xsl:choose>


				</main>
				<footer class="footer">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<h6>Weitere Informationen</h6>
								<p>
									<a
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=about"
										>About</a>
									<br/>
									<a
										href="/archive/objects/context:{$projectID}/methods/sdef:Context/get?mode=imprint"
										>Impressum</a>
									<br/>
									<a
										href="/archive/objects/context:gams/methods/sdef:Context/get?mode=dataprotection&amp;locale=de"
										>Datenschutz</a>
								</p>

								<div class="icons">
									<a href="/" target="_blank">
										<img class="footer_icons"
											src="/templates/img/gamslogo_weiss.gif" height="48"
											title="{$gams}" alt="{$gams}"/>
									</a>

									<a href="https://informationsmodellierung.uni-graz.at/"
										target="_blank">
										<img class="footer_icons" src="/templates/img/ZIM_weiss.png"
											height="48" title="{$zim-acdh}" alt="{$zim-acdh}"/>
									</a>


									<a href="http://creativecommons.org/licenses/by-nc/4.0/"
										target="_blank">
										<img class="footer_icons" src="/templates/img/by-nc.png"
											height="45" title="Lizenz" alt="Lizenz"/>
									</a>
								</div>
							</div>

							<div class="col-md-6">
								<h6>Kontakt</h6>
								<p>Ao. Univ.-Prof. Dr. Otto Geist <br/>Karl-Franzens-Universität
									Graz <br/>Institut für Romanistik und <br/>Zentrum für
									Kulturwissenschaften <br/>Forschungsbereich Allgemeine und
									Vergleichende Literaturwissenschaft </p>
								<p>
									<a href="mailto:otto.geist@uni-graz.at"
										>otto.geist@uni-graz.at</a>
								</p>
							</div>
						</div>
					</div>
				</footer>
			</body>
		</html>
	</xsl:template>

	<!--Ab hier je nach Bedarf ändern-->
	<xsl:template match="t:head" priority="-1">
		<xsl:choose>
			<xsl:when test="following-sibling::t:p">
				<h4>
					<xsl:value-of select="."/>
				</h4>
			</xsl:when>
			<xsl:otherwise>
				<h3>
					<xsl:value-of select="."/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="t:bibl" priority="-1">
		<p>
			<xsl:value-of select="./t:title"/>
		</p>
	</xsl:template>

	<xsl:template match="t:div" priority="-1">
		<div><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="t:p" priority="-1">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="t:lb" priority="-1">
		<br/>
	</xsl:template>

	<xsl:template match="t:ref" priority="-1">
		<a target="_blank">
			<xsl:attribute name="href">
				<xsl:value-of select="./@target"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</xsl:template>

</xsl:stylesheet>
