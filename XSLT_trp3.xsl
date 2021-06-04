<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Definimos el archivo de salid-->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">

        <!-- Definimos la estructura de la etiqueta empresa que recogera los datos principales de la empresa-->
        <empresa>

            <!-- Asignamos un atributo a la etiqueta denominado nombre-->
            <xsl:attribute name="nombre">
                <xsl:value-of select="/ite/empresa" />
            </xsl:attribute>

            <!-- Generamos la etiqueta datos de la empresa-->
            <datos>
                <nombre_comercial><xsl:value-of select="/ite/@nombre" /></nombre_comercial>
                <web><xsl:value-of select="/ite/@web" /></web>
                <telefono><xsl:value-of select="ite/telefono" /></telefono>
            </datos>

            <!-- Generamos la etiqueta cursos que agrupará todos los cursos existentes-->
            <cursos>

                <!-- La etiqueta ciclo se repite por lo que debemos iterarla-->
                <xsl:for-each select="/ite/ciclos/ciclo">

                    <!-- Generamos la etiqueta curso que recogerá las características de cada curso-->
                    <curso>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id" />
                        </xsl:attribute>
                        <nombre>
                            <xsl:attribute name="grado">
                                <xsl:value-of select="grado" />
                            </xsl:attribute>
                            <xsl:value-of select="nombre" />
                        </nombre>
                        <anyo_decreto><xsl:value-of select="decretoTitulo/@año" /></anyo_decreto>
                    </curso>
                </xsl:for-each>
            </cursos>

            <!-- Generamos la etiqueta equipo humano que agrupará todo el personal existente-->
            <equipo_humano>
                
                <!-- Generamos la etiqueta director-->
                <director>
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="/ite/director/nombre" />
                    </xsl:attribute>
                    <dpcho><xsl:value-of select="/ite/director/despacho" /></dpcho>
                </director>

                <!-- Generamos la etiqueta jefe_estudios-->
                <jefe_estudios>
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="/ite/jefe_estudios/nombre" />
                    </xsl:attribute>
                    <dpcho><xsl:value-of select="/ite/jefe_estudios/despacho" /></dpcho>
                </jefe_estudios>

                <!-- Generamos la etiqueta profesorado que agrupará todo los profesores-->
                <profesores>

                    <!-- La etiqueta profesor se repite por lo que debemos iterarla-->
                    <xsl:for-each select="/ite/profesores/profesor">
                        
                        <!-- Generamos la etiqueta profesor-->
                        <profesor>
                            <xsl:attribute name="id">
                                <xsl:value-of select="id" />
                            </xsl:attribute>
                            <nombre>
                                <xsl:value-of select="nombre" />
                            </nombre>
                        </profesor>
                    </xsl:for-each>
                </profesores>
            </equipo_humano>

        </empresa>
    </xsl:template>
</xsl:stylesheet>