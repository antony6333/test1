package home.antony.test1.model;


import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "id", "active", "password", "role", "contactName", "contactMail", "contactPhone" })
public class Account
{
    @JsonProperty("id")
    @NotNull(message = " Account id \u53ea\u80fd\u4f7f\u7528\u82f1\u6578\u5b57\u5143\u6216\u4e0b\u5217\u5176\u4e2d\u4e00\u9805: '-' '_' '.' '(' ')' ',' '$'")
    @Pattern(regexp = "^[\\d\\w-.(),$]+$", message = " Account id \u53ea\u80fd\u4f7f\u7528\u82f1\u6578\u5b57\u5143\u6216\u4e0b\u5217\u5176\u4e2d\u4e00\u9805: '-' '_' '.' '(' ')' ',' '$'")
    private String id;
    @JsonProperty("active")
    @NotNull(message = " true or false")
    private boolean active;
    @JsonProperty("password")
    @Pattern(regexp = "^[\\d\\w-.(),$]+$", message = " Account password 只能使用英數字元或下列其中一項: '-' '_' '.' '(' ')' ',' '$'")
    private String password;
    @JsonProperty("role")
    @Pattern(regexp = "^[\\d\\w-.(),$]+$", message = " Role name \u53ea\u80fd\u4f7f\u7528\u82f1\u6578\u5b57\u5143\u6216\u4e0b\u5217\u5176\u4e2d\u4e00\u9805: '-' '_' '.' '(' ')' ',' '$'")
    private String role;
    @JsonProperty("contactName")
    @NotBlank
    private String contactName;
    @JsonProperty("contactMail")
    @NotNull(message = " Contact Mail \u683c\u5f0f\u6709\u8aa4 ( ex. XXX@test.com.tw ) ")
    @Email(message = " Contact Mail \u683c\u5f0f\u6709\u8aa4 ( ex. XXX@test.com.tw ) ")
    private String contactMail;
    @JsonProperty("contactPhone")
    @NotNull(message = "Contact Phone \u683c\u5f0f\u6709\u8aa4 ( ex. 0912-345-678 ) ")
    @Pattern(regexp = "^09\\d{2}-?\\d{3}-?\\d{3}$", message = "Contact Phone \u683c\u5f0f\u6709\u8aa4 ( ex. 0912-345-678 ) ")
    private String contactPhone;

    public Account() {
    }

    public Account(final String id, final boolean active, final String password, final String role, final String contactName, final String contactMail, final String contactPhone) {
        this.id = id;
        this.active = active;
        this.password = password;
        this.role = role;
        this.contactName = contactName;
        this.contactMail = contactMail;
        this.contactPhone = contactPhone;
    }

    @JsonProperty("id")
    public String getId() {
        return this.id;
    }

    @JsonProperty("id")
    public void setId(final String id) {
        this.id = id;
    }

    @JsonProperty("active")
    public boolean isActive() {
        return this.active;
    }

    @JsonProperty("active")
    public void setActive(final boolean active) {
        this.active = active;
    }

    @JsonProperty("password")
    public String getPassword() {
        return this.password;
    }

    @JsonProperty("password")
    public void setPassword(final String password) {
        this.password = password;
    }

    @JsonProperty("role")
    public String getRole() {
        return this.role;
    }

    @JsonProperty("role")
    public void setRole(final String role) {
        this.role = role;
    }

    @JsonProperty("contactName")
    public String getContactName() {
        return this.contactName;
    }

    @JsonProperty("contactName")
    public void setContactName(final String contactName) {
        this.contactName = contactName;
    }

    @JsonProperty("contactMail")
    public String getContactMail() {
        return this.contactMail;
    }

    @JsonProperty("contactMail")
    public void setContactMail(final String contactMail) {
        this.contactMail = contactMail;
    }

    @JsonProperty("contactPhone")
    public String getContactPhone() {
        return this.contactPhone;
    }

    @JsonProperty("contactPhone")
    public void setContactPhone(final String contactPhone) {
        this.contactPhone = contactPhone;
    }
}
