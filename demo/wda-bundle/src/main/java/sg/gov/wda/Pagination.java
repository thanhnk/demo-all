package sg.gov.wda;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/***
 * 
 * @author ayetv
 * Store and Generate Pagination Info
 * 
 */
public class Pagination {
	private int offset;
	private final int LIMIT = 4;
	private long totalRecord;
	private String triggeredBtn;
	private final int TOTAL_PAGINATION = 5;
	
	protected final Logger log = LoggerFactory.getLogger(this.getClass());
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLIMIT() {
		return LIMIT;
	}
	public long getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}
	public String getTriggeredBtn() {
		return triggeredBtn;
	}
	public void setTriggeredBtn(String triggeredBtn) {
		log.info("TriggeredBtn findPageRange " + triggeredBtn);
		this.triggeredBtn = triggeredBtn;
		
		findPageRange(triggeredBtn);
	}
	public int getTOTAL_PAGINATION() {
		return TOTAL_PAGINATION;
	}
	public void findPageRange(String triggeredBtn) {
		int triggeredBtnID = Integer.parseInt(triggeredBtn);
		offset = (triggeredBtnID-1) * LIMIT;
	}
}
