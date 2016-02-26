/**
 * AJAXResponse common wrapper class for AJAX response
 */
package sg.gov.wda;

import java.util.ArrayList;
import java.util.List;

import flexjson.JSONSerializer;

/**
 * @author NCS Portal City
 *
 */
public class AJAXResponse {

	private List<String> message = new ArrayList<String>();
	private List<String> error = new ArrayList<String>();
	private List<Object> info = new ArrayList<Object>();
	private List<String> field = new ArrayList<String>();

	/**
	 * 
	 */
	public AJAXResponse() {
	}

	public List<String> getMessage() {
		return message;
	}

	public void setMessage(List<String> message) {
		this.message = message;
	}

	public List<String> getError() {
		return error;
	}

	public void setError(List<String> error) {
		this.error = error;
	}

	public List<Object> getInfo() {
		return info;
	}

	public void setInfo(List<Object> info) {
		this.info = info;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").deepSerialize(this);
	}

	public List<String> getField() {
		return field;
	}

	public void setField(List<String> field) {
		this.field = field;
	}

}
