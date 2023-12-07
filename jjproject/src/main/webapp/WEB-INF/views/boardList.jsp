<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- content 영역 -->
	<c:if test="${pList.size() >= 6 }">
	<div class="row container mt-3">
		<div class="col">
			<div class="row border border-3 m-1">
				<div class="col text-center m-3 border-end">
					<img src="resources/images/search.png" onclick="location.href='productList'" style="cursor:pointer"><br>All Product
				</div>
				<div class="col text-center m-3 border-end">
					<img src="resources/images/writing.png" id="writeBtn" style="cursor:pointer"><br>Write
				</div>
				<div class="col text-center m-3">
					<img src="resources/images/list.png" id="myListBtn" style="cursor:pointer"><br>My List
				</div>
			</div>
				<div class="row border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(5).no}'" style="cursor:pointer">
					<div class="col">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col fs-2 fw-bold mt-3 mb-3">
										${pList.get(5).title}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fw-lighter">
										${pList.get(5).content}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fs-3">
										${pList.get(5).price}
									</div>
								</div>
								<div class="col mb-3">
                                    <span id="rg1" style="display:none">${pList.get(5).regDate}</span>
									<br>	
									<h1 class="clock1" style="color:red"></h1>
								</div>
							</div>
							<div class="col d-flex justify-content-center align-items-center">
								<img class="img-fluid" src="resources/upload/${pList.get(5).file1}"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(1).no}'" style="cursor:pointer">
					<div class="col">
						<div class="row">
							<div class="col d-flex justify-content-center align-items-center">
								<img src="resources/upload/${pList.get(1).file1}" style="width:250px; height:200px; object-fit: fill;"/>
							</div>
							<div class="col">
								<div class="row">
									<div class="col fs-2 fw-bold mt-3 mb-3">
										${pList.get(1).title}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fw-lighter">
										${pList.get(1).content}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fs-3">
										${pList.get(1).price}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
	                                    <span id="rg2" style="display:none">${pList.get(1).regDate}</span>
										<br>	
										<h1 class="clock2" style="color:red"></h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(2).no}'" style="cursor:pointer">
					<div class="col">
						<div class="row">
							<div class="col d-flex justify-content-center align-items-center">
								<img src="resources/upload/${pList.get(2).file1}" style="width:250px; height:300px; object-fit: fill;"/>
							</div>
							<div class="col">
								<div class="row">
									<div class="col fs-2 fw-bold mt-3 mb-3">
										${pList.get(2).title}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fw-lighter">
										${pList.get(2).content}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fs-3">
										${pList.get(2).price}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<span id="rg3" style="display:none">${pList.get(2).regDate}</span>
										<br>	
										<h1 class="clock3" style="color:red"></h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
			<div class="col-6 ">
				<div class="row">
					<div class="col border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(3).no}'" style="cursor:pointer">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col d-flex justify-content-center align-items-center">
										<img src="resources/upload/${pList.get(3).file1}" style="width:200px; height:200px; object-fit: fill;"/>
									</div>
								</div>
								<div class="row">
									<div class="col fs-2 fw-bold mt-3 mb-3">
										${pList.get(3).title}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fw-lighter">
										${pList.get(3).content}
										<br>
										<br>
									</div>
								</div>
								<div class="row">
									<div class="col fs-3 mb-3">
										${pList.get(3).price}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<span id="rg4" style="display:none">${pList.get(3).regDate}</span>
										<br>	
										<h1 class="clock4" style="color:red"></h1>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(4).no}'" style="cursor:pointer">
						<div class="row">
							<div class="col d-flex justify-content-center align-items-center">
								<img src="resources/upload/${pList.get(4).file1}" style="width:250px; height:200px; object-fit: fill;"/>
							</div>
						</div>
						<div class="row">
							<div class="col fs-2 fw-bold mt-3 mb-3">
								${pList.get(4).title}
							</div>
						</div>
						<div class="row">
							<div class="col mb-3 fw-lighter">
								${pList.get(4).content}
							</div>
						</div>
						<div class="row">
							<div class="col fs-3 mb-3">
								${pList.get(4).price}
							</div>
						</div>
						<div class="row">
							<div class="col mb-3">
								<span id="rg5" style="display:none">${pList.get(4).regDate}</span>
								<br>	
								<h1 class="clock5" style="color:red"></h1>
							</div>
						</div>
					</div>
				</div>
				<div class="row border border-4 m-2" onclick="location.href='productDetail?no=${pList.get(0).no}'" style="cursor:pointer">
					<div class="col">
						<div class="row">
							<div class="col d-flex justify-content-center align-items-center">
								<img src="resources/upload/${pList.get(0).file1}" style="width:300px; height:280px; object-fit: fill;"/>
							</div>
							<div class="col">
								<div class="row">
									<div class="col fs-2 fw-bold mt-3 mb-3">
										${pList.get(0).title}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3 fw-lighter">
										${pList.get(0).content}
									</div>
								</div>
								<div class="row">
									<div class="col fs-3 mb-3">
										${pList.get(0).price}
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
	                                    <span id="rg6" style="display:none">${pList.get(0).regDate}</span>
										<br>	
										<h1 class="clock6" style="color:red"></h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="row">
				<img src="resources/images/ad.png">
			</div>
		</div>
	</div>
	</c:if>