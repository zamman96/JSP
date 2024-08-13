<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div class="col-md-12 card">
	<div class="card-header">
		<h2>${SPRING_SECURITY_403_EXCEPTION.getMessage()}</h2> <!-- Access is denied -->
	</div>
	<div class="card-body">
		<h6>${auth}</h6>
	</div>
</div>
