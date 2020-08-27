package home.antony.test1.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.RandomStringGenerator;
import org.springframework.data.annotation.Id;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Date;

public class UserDB extends Account
{
    @Id
    private String id;
    private String tenantId;
    private String accountId;
    private OrgStatusEnum status;
    private Date createTime;
    private Date updateTime;
    private String salt;

    public UserDB(final String id, final boolean active, final String password, final String role, final String contactName, final String contactMail, final String contactPhone, final String tenantId, final String accountId, final OrgStatusEnum status, final Date createTime, final Date updateTime, final String salt) {
        super(id, active, password, role, contactName, contactMail, contactPhone);
        this.tenantId = tenantId;
        this.accountId = accountId;
        this.status = status;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.salt = salt;
    }

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void setId(final String id) {
        this.id = id;
    }

    public String getSalt() {
        return this.salt;
    }

    public void setSalt(final String salt) {
        this.salt = salt;
    }

    public String getTenantId() {
        return this.tenantId;
    }

    public void setTenantId(final String tenantId) {
        this.tenantId = tenantId;
    }

    public String getAccountId() {
        return this.accountId;
    }

    public void setAccountId(final String accountId) {
        this.accountId = accountId;
    }

    public OrgStatusEnum getStatus() {
        return this.status;
    }

    public void setStatus(final OrgStatusEnum status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(final Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(final Date updateTime) {
        this.updateTime = updateTime;
    }

    public static String Encrytor(final String str, final String encodedKey) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        final Cipher c = Cipher.getInstance("AES");
        c.init(1, EncrypAES(encodedKey));
        final byte[] src = str.getBytes();
        return Base64.getEncoder().encodeToString(c.doFinal(src));
    }

    private static SecretKey EncrypAES(final String encodedKey) throws NoSuchAlgorithmException, NoSuchPaddingException {
        final byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
        final SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
        return originalKey;
    }

    public static String Decryptor(final byte[] buff, final String encodedKey) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchPaddingException, NoSuchAlgorithmException {
        final Cipher c = Cipher.getInstance("AES");
        c.init(2, EncrypAES(encodedKey));
        return new String(c.doFinal(buff));
    }

    public static String encryptPassword(final String info) throws NoSuchAlgorithmException {
        final MessageDigest sha = MessageDigest.getInstance("SHA-256");
        final byte[] srcBytes = info.getBytes();
        sha.update(srcBytes);
        final byte[] resultBytes = sha.digest();
        return new String(resultBytes, StandardCharsets.UTF_8);
    }

    public Boolean checkPassword(final String password) throws NoSuchAlgorithmException {
        if (password == null || this.getPassword() == null) {
            return Boolean.valueOf(false);
        }
        //System.out.println("this.getPassword():"+this.getPassword()+", encryptPassword(password):"+encryptPassword(password));
        //System.out.println(Boolean.valueOf(StringUtils.equals(this.getPassword(), encryptPassword(password))));
        return Boolean.valueOf(StringUtils.equals(this.getPassword(), encryptPassword(password)));
    }

    public static String generateRandomSpecialCharacters(final int length) {
        final RandomStringGenerator pwdGenerator = new RandomStringGenerator.Builder().withinRange(33, 126).build();
        return pwdGenerator.generate(length);
    }
}
