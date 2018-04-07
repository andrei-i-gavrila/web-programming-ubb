<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                      crossorigin="anonymous"/>
            </head>
            <body>
                <div class="container">

                    <ul class="nav nav-tabs" role="tablist">
                        <xsl:for-each select="wikipedia/page">
                            <xsl:variable name="title">
                                <xsl:value-of select="title"/>
                            </xsl:variable>
                            <li class="nav-item">
                                <a class="nav-link" id="{$title}-tab" data-toggle="pill" href="#{$title}" role="tab"
                                   aria-controls="{$title}" aria-selected="true">
                                    <xsl:value-of select="title"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>

                    <div class="tab-content">
                        <xsl:for-each select="wikipedia/page">
                            <xsl:variable name="title">
                                <xsl:value-of select="title"/>
                            </xsl:variable>
                            <xsl:variable name="image-url">
                                <xsl:value-of select="image"/>
                            </xsl:variable>
                            <xsl:variable name="url">
                                <xsl:value-of select="url"/>
                            </xsl:variable>
                            <div class="tab-pane fade" id="{$title}" role="tabpanel" aria-labelledby="{$title}-tab">
                                <div class="row m-5">
                                    <div class="col-3">
                                        <a href="{$url}">
                                            <img class="img-thumbnail" src="{$image-url}"/>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <xsl:value-of select="description"/>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"/>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                        crossorigin="anonymous"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

