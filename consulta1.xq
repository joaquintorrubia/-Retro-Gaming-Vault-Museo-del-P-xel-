
declare namespace file = "http://expath.org/ns/file";

let $xml := doc("retro_vault.xml")


let $html := 
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Retro-Gaming Vault  Parte 1</title>
</head>
<body>
    <header>
        <h1>Retro-Gaming Vault</h1>
    </header>
    <main>
        <section>
            <h2>Consulta 1: La Era Dorada (Hardware antes de 1985)</h2>
            {
                for $item in $xml//Item[@categoria = 'Hardware' and xs:integer(AnioLanzamiento) < 1985]
                order by xs:integer($item/AnioLanzamiento)
                return 
                <article>
                    <h3>{data($item/Nombre)}</h3>
                    <ul>
                        <li><strong>Fabricante:</strong> {data($item/Fabricante)}</li>
                        <li><strong>Año:</strong> {data($item/AnioLanzamiento)}</li>
                        <li><strong>Serial Number:</strong> {data($item/SerialNumber)}</li>
                    </ul>
                </article>
            }
        </section>
    </main>
</body>
</html>


let $ruta_salida := "C:/Users/joaquin/Desktop/consulta1.html"


return file:write($ruta_salida, $html, 
map {
    "method": "html",
    "version": "5.0",
    "indent": "yes",
    "omit-xml-declaration": "yes",
    "encoding": "UTF-8"
})
