# Github_PhanTichThietKeHeThong_Viettle
# 👥 System Analysis & Design Case Study: Hệ Thống Quản Lý Nhân Sự Viettel

Dự án phân tích và thiết kế hệ thống quản lý nhân sự nhằm hỗ trợ quản lý tập trung thông tin nhân viên, tuyển dụng, hồ sơ, chấm công, tính lương và báo cáo – thống kê. Dự án tập trung khảo sát quy trình nghiệp vụ, xác định yêu cầu và mô hình hóa hệ thống làm cơ sở cho việc thiết kế cơ sở dữ liệu và xây dựng chương trình mẫu.

---

## 📋 Thông tin đồ án

- 👩‍💻 **Sinh viên thực hiện:** Phan Thị Yến Ngọc
- 🎓 **MSSV:** 2321004044
- 🏫 **Chuyên ngành:** Hệ thống Thông tin Quản lý
- 🏢 **Đơn vị nghiên cứu:** Tập đoàn Công nghiệp – Viễn thông Quân đội (Viettel)
- 📅 **Thời gian thực hiện:** 08/2025
- 📌 **Đề tài:** Phân tích và thiết kế hệ thống quản lý nhân sự Viettel

---

## 🛠️ Công cụ & Kỹ thuật Phân tích

- 📌 **Phân tích nghiệp vụ:** Khảo sát, phỏng vấn, xác định yêu cầu
- 📌 **Mô hình hóa quy trình:** BPMN (Business Process Model and Notation)
- 📌 **Mô hình phân rã chức năng:** BFD (Business Function Diagram)
- 📌 **Phân tích luồng dữ liệu:** DFD (Data Flow Diagram)
- 📌 **Mô hình hóa chức năng:** Use Case Diagram
- 📌 **Thiết kế dữ liệu:** ERD (Entity Relationship Diagram)
- 📌 **Cơ sở dữ liệu:** Microsoft SQL Server
- 📌 **Lập trình:** C# WinForms
- 📌 **Môi trường phát triển:** Microsoft Visual Studio
- 📌 **Thiết kế CSDL:** PowerDesigner
- 📌 **Công cụ mô hình hóa:** Draw.io, Enterprise Architect

---

## 🚀 Các Giai Đoạn Phân Tích Cốt Lõi

### 1. Khảo sát hiện trạng & Thu thập yêu cầu

- Thực hiện khảo sát các nghiệp vụ chính gồm **tuyển dụng, quản lý hồ sơ, chấm công, tính lương, khen thưởng – kỷ luật, nghỉ việc, phân quyền và báo cáo nhân sự**.
- Xây dựng kế hoạch và nội dung phỏng vấn đối với **chuyên viên nhân sự và nhân viên** để thu thập thông tin về quy trình và nhu cầu sử dụng hệ thống.
- Xác định các vấn đề trong quá trình quản lý như **dữ liệu chưa đồng bộ, sai lệch chấm công, hạn chế trong báo cáo và yêu cầu kiểm soát phân quyền**.
- Tổng hợp kết quả khảo sát làm cơ sở xác định yêu cầu hệ thống.

---

### 2. Phân tích nghiệp vụ & Mô hình hóa hệ thống

- Phân tích các quy trình nghiệp vụ chính của hệ thống:
  - 👤 Quản lý tuyển dụng
  - 📁 Quản lý hồ sơ nhân viên
  - ⏰ Quản lý chấm công – đăng ký công
  - 💰 Quản lý tính lương
  - 🏆 Quản lý khen thưởng – kỷ luật
  - 📊 Báo cáo – thống kê nhân sự
- Xây dựng **BPMN** để mô tả chi tiết các quy trình nghiệp vụ.
- Xây dựng **BFD** để phân rã hệ thống thành các nhóm chức năng.
- Xây dựng **DFD mức 0, mức 1 và mức 2** để mô tả luồng dữ liệu giữa tác nhân, tiến trình và kho dữ liệu.
- Xây dựng **Use Case Diagram** để xác định tác nhân và chức năng tương tác với hệ thống.

---

### 3. Thiết kế cơ sở dữ liệu

- Phân tích các đối tượng dữ liệu và mối quan hệ giữa các thực thể trong hệ thống quản lý nhân sự.
- Thiết kế cơ sở dữ liệu trên **Microsoft SQL Server** với các nhóm dữ liệu về nhân viên, phòng ban, bộ phận, hợp đồng, chấm công, lương, bảo hiểm, khen thưởng và kỷ luật.
- Xây dựng **khóa chính, khóa ngoại và các ràng buộc toàn vẹn dữ liệu**.
- Sử dụng **Stored Procedure và Trigger** để hỗ trợ xử lý nghiệp vụ và kiểm soát dữ liệu.
- Thiết kế mô hình cơ sở dữ liệu bằng **PowerDesigner**.

---

### 4. Thiết kế giao diện & Xây dựng chương trình mẫu

- Thiết kế giao diện quản lý nhân sự theo các chức năng nghiệp vụ đã phân tích.
- Xây dựng chương trình mẫu bằng **C# WinForms** trên **Visual Studio**.
- Kết nối ứng dụng với **SQL Server** để truy vấn và cập nhật dữ liệu.
- Xây dựng các chức năng quản lý:
  - 🔐 Đăng nhập & đổi mật khẩu
  - 🏢 Phòng ban & bộ phận
  - 👤 Thông tin nhân viên
  - 📄 Hợp đồng
  - ⏰ Chấm công
  - 💰 Bảng lương
  - 📊 Báo cáo – thống kê
- Thiết kế phân quyền truy cập phù hợp với từng nhóm người dùng.

---

