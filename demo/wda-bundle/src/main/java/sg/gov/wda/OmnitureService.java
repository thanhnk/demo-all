package sg.gov.wda;

import org.apache.sling.api.SlingHttpServletRequest;

public interface OmnitureService {
	public String test();

	public AJAXResponse retrieveRelativePages(SlingHttpServletRequest request);
}
