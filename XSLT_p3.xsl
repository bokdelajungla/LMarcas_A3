<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Nodo del documento en el que nos situamos (raiz)-->
    <xsl:template match="/">
        <html>
            
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Instituto Tecnológico EDIX</title>
                <!-- Archivo que contiene la hoja de esitlos CSS del documento-->
                <link rel="stylesheet" href="CSS_p3.css" />
            </head>

            <body>
                <div id="contenedor">
                    <header>
                        <h1>
                            <xsl:value-of select="/ite/@nombre" />
                        </h1>
                    </header>

                    <nav>
                        <ul>
                            <!-- Creación de una lista desordenada y 3 enlaces para dar cumplimiento a los requerimientos de la actividad-->
                            <li><a href="#1">Estudios del centro</a></li>
                            <li><a href="#2">Equipo humano</a></li>
                            <li><a href="contacto.html">Contacto</a></li>
                        </ul> 
                    </nav>

                    <section>
                        <article>                            
                            <h2 id="1">Estudios del centro</h2>

                            <!-- Creación de una tabla para dar cumplimiento a los requerimientos de la actividad-->
                            <table>
                                <caption>
                                    <h3>Ciclos formativos</h3>
                                </caption>
                                <thead>
                                    <tr>
                                        <th>Ciclo - Abreviatura</th>
                                        <th>Grado</th>
                                        <th>Año del decreto</th>
                                    </tr>
                                </thead>
                                <!-- Como la etiqueta "ciclo" aparece varias veces debemos iterarla-->
                                <xsl:for-each select="/ite/ciclos/ciclo">
                                    <!-- Ordenamos los ciclos por su nombre-->
                                    <xsl:sort select="nombre" />
                                    <tbody>
                                        <tr>
                                            <!-- Elegimos los elementos que queremos mostrar en la tabla-->
                                            <td>
                                                <xsl:value-of select="nombre" />
                                                -
                                                <xsl:value-of select="@id" />
                                            </td>
                                            <td>
                                                <xsl:value-of select="grado" />
                                            </td>
                                            <td class="center">
                                                <xsl:value-of select="decretoTitulo/@año" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </xsl:for-each>
                            </table>
                        </article>
                    

                        <article>
                            <h2 id="2">Equipo Humano</h2>

                            <!-- Creación de una tabla para dar cumplimiento a los requerimientos de la actividad-->
                            <table>
                                <caption>
                                    <h3>Director</h3>
                                </caption>
                                <tr>
                                    <!-- Creación de una lista desordenada para dar cumplimiento a los requerimientos de la actividad-->
                                    <ul>                                        
                                        <li>
                                            <xsl:value-of select="/ite/director/nombre" />
                                            <ul>
                                                <li_clean>
                                                    Dpcho:       

                                                    <xsl:value-of select="ite/director/despacho" />
                                                </li_clean>
                                            </ul>
                                        </li>
                                    </ul>
                                </tr>
                            </table>

                            <!-- Creación de una tabla para dar cumplimiento a los requerimientos de la actividad-->
                            <table>
                                <caption>
                                    <h3>Jefe de Estudios</h3>
                                </caption>
                                <tr>
                                    <!-- Creación de una lista desordenada para dar cumplimiento a los requerimientos de la actividad-->
                                    <ul>
                                        <li>
                                            <xsl:value-of select="/ite/jefe_estudios/nombre" />
                                            <ul>
                                                <li_clean>
                                                    Dpcho:
                                                    <xsl:value-of select="ite/jefe_estudios/despacho" />
                                                </li_clean>
                                            </ul>
                                        </li>
                                    </ul>
                                </tr>
                            </table>

                            <!-- Creación de una tabla para dar cumplimiento a los requerimientos de la actividad-->
                            <table>
                                <caption>
                                    <h3>Profesorado</h3>
                                </caption>
                                <tr>
                                    <!-- Creación de una lista desordenada para dar cumplimiento a los requerimientos de la actividad-->
                                    <ul>
                                        <!-- Como la etiqueta "ciclo" aparece varias veces debemos iterarla-->
                                        <xsl:for-each select="/ite/profesores/profesor">
                                            <!-- Ordenamos los ciclos por su nombre-->
                                            <xsl:sort select="nombre" />
                                            <li>
                                                <xsl:value-of select="nombre" />
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </tr>
                            </table>
                        </article>
                    
                    </section>

                    <footer>
                        Copyright 2021 -
                        <!-- Creación de un enlace para dar cumplimiento a los requerimientos de la actividad-->
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="/ite/@web" />
                            </xsl:attribute>
                            <xsl:value-of select="/ite/@nombre"/>
                        </a>  
                    </footer>
                </div>
            </body>

        </html>
    </xsl:template>
</xsl:stylesheet>