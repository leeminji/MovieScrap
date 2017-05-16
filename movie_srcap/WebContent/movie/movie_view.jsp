<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"></c:import>

<!-- content -->
<section class="content">
	<div class="content_area">
		<div class="section movie_area">
			<h2 class="title01">${movie.title }</h2>
			<c:choose>
				<c:when test="${movie.titleOrg == '' }">
					<p class="text01">${movie.title }, ${movie.prodYear }</p>
				</c:when>
				<c:when test="${movie.titleOrg != null }">
					<p class="text01">${movie.titleOrg }, ${movie.prodYear }</p>
				</c:when>
			</c:choose>
			<div class="movie_detail_top clearfix">
				<div class="movie_img">
					<c:forTokens items="${movie.poster}" delims="|" var="poster" begin="0" end="0">
						<img src="${poster}" alt="" />
					</c:forTokens>

				</div>
				<ul class="clear list01 movie_detail_area">
					<li>${api }</li>
					<li><span class="tit">개요</span>
						<span class="con">${movie.genre }</span>
					</li>
					<li><span class="tit">감독</span>
						<span class="con">${movie.director }</span>
					</li>
					<li><span class="tit">출연</span>
						<span class="con">
						<c:forEach items="${movie.actor }" var="actor" varStatus="status">
						<c:if test="${status.index != 0}">,</c:if>
						${actor }
						</c:forEach>
						</span>
					</li>
					<li>
						<span class="tit">등급</span>
						<span class="con">${movie.rating }</span>
					</li>
					<li>
						<span class="tit">상영시간</span>
						<span class="con">${movie.runtime } 분</span>
					</li>
				</ul>
			</div>
			<div class="btn_area_center movie_btn">
				<a href="./MovieScrapAdd.bo?id=${param.id }&seq=${param.seq}">
					스크랩하기
				</a>
				<a href="./MovieReview.bo?id=${param.id }&seq=${param.seq}">리뷰하기</a>
				<a href="">토론하기</a>
			</div>
			<div class="movie_img_list slider_list">
				<h2 class="title02">영화이미지</h2>
				<div class="viewer">
					<ul class="clear clearfix">
						
						<c:forTokens items="${movie.stlls}" delims="|" var="stlls">
							<li><a href="#"><img src="${stlls}" alt="" /></a></li>
						</c:forTokens>
						
						<%-- <li><a href="#"><img src="${IMG_PATH }/poster/mv_img01.jpg" alt="" /></a></li> --%>
					</ul>
				</div>
				<div class="slider_nav"></div>
			</div>
			<!-- movie_content -->
			<div class="movie_content">
				<div class="tab">
					<div class="tab_area_wrap tab">
						<ul class="clearfix clear tab_title">
							<li><a href="#tab_main">주요정보</a></li>
							<li><a href="#tab_actor">배우제작진</a></li>
							<li><a href="#tab_video">동영상</a></li>
							<li><a href="#tab_review">리뷰</a></li>
						</ul>
					
						<div class="tab_content" id="tab_main">
							${movie.plot }
						</div>
						<div class="tab_content" id="tab_actor">
							${movie.actor }
						</div>
						<div class="tab_content" id="tab_video">
							<%-- ${movie.vodUrl } --%>
						</div>	
						<div class="tab_content" id="tab_review">
							<textarea name="" id="" cols="50" rows="17" ></textarea>
							<br>
							<div><label for="ms_myRating">평점&nbsp;&nbsp;</label>
							<input type="text" id="ms_myRating" name="ms_myRating" size="2" maxlength="2" min="0" max="10" placeholder="/10"/>
							</div>
							<br>
							<ul class="clearfix clear tab_title">
								<li><a href="./MovieReview.bo?id=${param.id }&seq=${param.seq}">저장</a></li>
								<li><a href="#">다시작성</a></li>
							</ul>
						</div>	
					</div>
				</div>
			</div>
			<!-- //movie_content -->
		</div>
	</div>
</section>
<!-- //content -->

<c:import url="../layout/footer.jsp"></c:import>