package home.antony.test1.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.annotation.JsonValue;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Antony
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "status" })
public enum OrgStatusEnum {
    //ID_ENABLE
    ID_ENABLE("enable"),
    //ID_DISABLE(不能登但vm不會關機)
    ID_DISABLE("disable"),
    //停用(不能登入且vm關機)
    SUSPEND("suspend"),
    //復原(正常) @Deprecated
    RESUME("resume"),
    //停用(刪除)
    DELETE("delete");

    private final String value;
    private static final Map<String, OrgStatusEnum> CONSTANTS;

    OrgStatusEnum(final String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.value;
    }

    @JsonValue
    public String value() {
        return this.value;
    }

    @JsonCreator
    public static OrgStatusEnum fromValue(final String value) {
        final OrgStatusEnum constant = OrgStatusEnum.CONSTANTS.get(value);
        if (constant == null) {
            throw new IllegalArgumentException(value);
        }
        return constant;
    }

    static {
        CONSTANTS = new HashMap<>();
        for (final OrgStatusEnum c : values()) {
            OrgStatusEnum.CONSTANTS.put(c.value, c);
        }
    }
}