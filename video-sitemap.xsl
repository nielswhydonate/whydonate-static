<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet version="2.0"
	xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
	<head>
		<title>XML sitemap - WhyDonate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
			body {
				font-size: 14px;
				font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif;
				margin: 0;
				color: #545353;
			}
			a {
				color: #05809e;
				text-decoration: none;
			}
			h1 {
				font-size: 24px;
				font-family: Verdana,Geneva,sans-serif;
				font-weight: normal;
				margin: 0;
			}

			#description {
				background-color: #4275f4;
				padding: 20px 40px;
				color: #fff;
				padding: 30px 30px 20px;
			}
			#description h1,
			#description p,
			#description a {
				color: #fff;
				margin: 0;
				font-size: 1.1em;
			}
			#description h1 {
				font-size: 2em;
				margin-bottom: 1em;
			}
			#description p {
				margin-top: 5px;
			}

			#content {
				padding: 20px 30px;
				background: #fff;
				max-width: 75%;
				margin: 0 auto;
			}

			table {
				border: none;
				border-collapse: collapse;
				font-size: .9em;
				width: 100%;
			}
			th {
				background-color: #4275f4;
				color: #fff;
				text-align: left;
				padding: 15px;
				font-size: 14px;
				cursor: pointer;
			}
			td {
				padding: 10px;
				border-bottom: 1px solid #ddd;
			}
			tbody tr:nth-child(even) {
				background-color: #f7f7f7;
			}
			table td a {
				display: block;
			}
		</style>
	</head>
	<body>
		<div id="description">
			<h1>Video sitemap</h1>
							<p>
					Deze video sitemap is gegenereerd door <a href="https://rankmath.com/" target="_blank">Rank Math WordPress SEO plugin</a>. Het is wat zoekmachines zoals Google gebruiken om de video inhoud op je site te vinden en te begrijpen.				</p>
			
			<p>
				Meer informatie over <a href="https://developers.google.com/search/docs/advanced/sitemaps/video-sitemaps" target="_blank">Video sitemap</a>.			</p>
		</div>
		<div id="content">
			<p>
				Deze XML sitemap bevat <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url/video:video)"/></strong> URL's.			</p>
			<p class="expl">
				<a href="/sitemap_index.xml">- Sitemap-index</a>			</p>
			<table id="sitemap" cellpadding="3">
				<thead>
					<tr>
						<th width="15%">Video</th>
						<th width="20%">Titel</th>
						<th width="20%">Beschrijving</th>
						<th width="15%">Tags</th>
						<th width="15%">Laatste wijziging.</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="sitemap:urlset/sitemap:url">
						<xsl:for-each select="video:video">
							<tr>
								<td>
									<xsl:variable name="thumbURL">
										<xsl:value-of select="video:thumbnail_loc"/>
									</xsl:variable>

									<xsl:variable name="flvURL">
										<xsl:value-of select="video:player_loc"/>
									</xsl:variable>

									<a href="{$flvURL}">
										<xsl:choose>
											<xsl:when test="$thumbURL != ''">
												<img src="{$thumbURL}" width="80" height="60" />
											</xsl:when>
											<xsl:otherwise>
												-
											</xsl:otherwise>
										</xsl:choose>
									</a>
								</td>
								<td>
									<xsl:variable name="itemURL">
										<xsl:value-of select="../sitemap:loc"/>
									</xsl:variable>
									<a href="{$itemURL}">
										<xsl:value-of select="video:title"/>
									</a>
								</td>
								<td>
									<xsl:variable name="desc">
										<xsl:value-of select="video:description"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($desc) &lt; 200">
											<xsl:value-of select="$desc"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat(substring($desc,1,200),' ...')"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:for-each select="video:tag">
										<xsl:value-of select="."/>,
									</xsl:for-each>
								</td>
								<td>
									<xsl:value-of select="concat(substring(video:publication_date,0,11),concat(' ', substring(video:publication_date,12,5)),concat(' ', substring(video:publication_date,20,6)))"/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
