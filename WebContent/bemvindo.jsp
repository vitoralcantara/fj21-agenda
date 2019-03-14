<html>
<head>
<title>Projeto fj21-agenda</title>
</head>
<body>
	<%-- comentário em JSP aqui: nossa primeira página JSP --%>
	<% String mensagem = "Bem vindo ao sistema de agenda do FJ-21!"; %>
	<% out.println(mensagem); %>
	<br />
	<% String desenvolvido = "Desenvolvido por Vitor"; %>
	<%= desenvolvido %>
	<br />
	<% System.out.println("Tudo foi executado!"); %>
</body>
</html>