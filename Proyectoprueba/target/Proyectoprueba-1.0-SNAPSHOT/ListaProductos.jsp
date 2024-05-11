<%-- 
    Document   : ListaProductos
    Created on : 6 may. 2024, 21:13:56
    Author     : Usuario
--%>

<%@page import="Controller.DaoProducto"%>
<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <table class="table">
            <tr>
                <th scope="col">Código</th>
                <th scope="col">Nombre</th>
                <th scope="col">Descripción</th>
                <th scope="col">Costo unitario</th>
                <th scope="col">Stock</th>
                <th scope="col">Fecha de ingreso</th>
                <th scope="col">Fecha de caducidad</th>
                <th scope="col">Imagen</th>
                <th scope="col">Estado</th>
                <th scope="col">Categoría</th>
            </tr>
            <tr>
                <%
                    DaoProducto daop = new DaoProducto();
                    ArrayList<Producto> lista = daop.leer();

                    for (Producto p : lista) {
                %>


                <th scope="row" ><%= p.getIdproducto()%></th>
                <td><%= p.getNombreproducto()%></td>
                <td><%= p.getDescripcion()%></td>
                <td><%= p.getCostouni()%></td>
                <td><%= p.getStock()%></td>
                <td><%= p.getStock()%></td>
                <td><%= p.getFechaing()%></td>
                <td><%= p.getFechacad()%></td>
                <td><img src="<%= p.getRutaimg()%>" alt="alt"/></td>
                <td><%= p.getEstado()%></td>
                <td><%= p.getIdcategoria()%></td>
                <%
                    }
                %>


            </tr>
        </table>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
