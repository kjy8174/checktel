<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paginationInfo" required="true"
	type="brother.heyflight.checktel.blog.PaginationInfo"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="fn_egov_link_page"></c:set>
</c:if>

<div class="text-center">
	<div class="pagination-wrap">
		<ul class="pagination">
			<li><a aria-label="Previous" href="#"> <span
					aria-hidden="true"><i class="fa fa-angle-left"></i></span>

			</a></li>
			<c:forEach begin="${paginationInfo.firstPageNoOnPageList}"
				end="${paginationInfo.lastPageNoOnPageList}" var="p">
				<c:if test="${paginationInfo.currentPageNo == p }">
					<li class="active"><a href="#">${p}</a></li>
				</c:if>
				<c:if test="${paginationInfo.currentPageNo != p }">
					<li><a href="#" onclick="${jsFunc}(${p})">${p}</a></li>
				</c:if>
			</c:forEach>
			<li><a aria-label="Next" href="#"> <span aria-hidden="true"><i
						class="fa fa-angle-right"></i></span>
			</a></li>
		</ul>
	</div>
</div>