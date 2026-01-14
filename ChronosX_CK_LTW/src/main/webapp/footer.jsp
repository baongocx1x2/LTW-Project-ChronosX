<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}"/>
<fmt:setBundle basename="messages"/>

<footer class="bg-dark text-white mt-5">
  <div class="container py-5">
    <div class="row">

      <!-- CỘT 1: CÔNG TY -->
      <div class="col-md-3">
        <h5><fmt:message key="footer.company"/></h5>
        <p><fmt:message key="footer.vat"/>: 0315286507</p>
        <p>
          <fmt:message key="footer.license">
            <fmt:param value="24/06/2024"/>
          </fmt:message>
        </p>
      </div>

      <!-- CỘT 2: ĐỊA CHỈ -->
      <div class="col-md-3">
        <h5><fmt:message key="footer.address.title"/></h5>
        <p>
          📍 <fmt:message key="footer.address.detail"/>
        </p>
        <p>
          📞 (+84) 28 3821 6848
        </p>
      </div>

      <!-- CỘT 3: CHÍNH SÁCH -->
      <div class="col-md-3">
        <h5><fmt:message key="footer.policy.title"/></h5>
        <ul class="list-unstyled">
          <li><a href="#" class="text-white"><fmt:message key="footer.policy.privacy"/></a></li>
          <li><a href="privacy.jsp" class="text-white"><fmt:message key="footer.policy.shipping"/></a></li>
          <li><a href="#" class="text-white"><fmt:message key="footer.policy.return"/></a></li>
          <li><a href="#" class="text-white"><fmt:message key="footer.policy.payment"/></a></li>
        </ul>
      </div>

      <!-- CỘT 4: KHÁM PHÁ -->
      <div class="col-md-3">
        <h5><fmt:message key="footer.explore.title"/></h5>
        <ul class="list-unstyled">
          <li><a href="news" class="text-white"><fmt:message key="footer.explore.news"/></a></li>
          <li><a href="#" class="text-white"><fmt:message key="footer.explore.search"/></a></li>
          <li><a href="#" class="text-white"><fmt:message key="footer.explore.stores"/></a></li>
        </ul>
      </div>

    </div>

    <!-- DÒNG CUỐI -->
    <div class="text-center mt-4">
      <img src="images/logo-ssgroup.png" alt="ChronosX Group" style="height: 40px;">
      <p class="mt-2">
        <fmt:message key="footer.certified"/>
      </p>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</footer>

</body>
</html>