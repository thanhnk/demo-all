package sg.gov.wda.adapters;

import org.apache.solr.common.SolrInputDocument;
import org.json.simple.JSONObject;

public abstract class CourseContentType {
	public static final CourseContentType NULL = new CourseContentType() {
		@Override
		public JSONObject getJson() {
			return new JSONObject();
		}

		@Override
		public SolrInputDocument getSolrDoc() {
			return null;
		}
	};

	/**
	 * A JSON object following a structure compatible with Solr's JSON update
	 * handler.
	 *
	 * @return Valid JSON object on success and an empty JSON object on
	 *         otherwise.
	 */
	public abstract JSONObject getJson();

	/**
	 * @return Valid SolrDocument object on success and <code>null</code>
	 *         otherwise.
	 */
	public abstract SolrInputDocument getSolrDoc();
}
