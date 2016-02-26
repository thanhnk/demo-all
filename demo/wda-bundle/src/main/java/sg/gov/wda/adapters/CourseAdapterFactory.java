package sg.gov.wda.adapters;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.adapter.AdapterFactory;
import org.apache.sling.api.resource.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component(metatype = false)
@Service(AdapterFactory.class)
public class CourseAdapterFactory implements AdapterFactory {

	private static final Logger LOG = LoggerFactory
			.getLogger(CourseAdapterFactory.class);
	private static final Class<CoursePage> COURSE_CLASS = CoursePage.class;

	@Property(name = "adapters")
	public static final String[] ADAPTER_CLASSES = { COURSE_CLASS.getName() };

	@Property(name = "adaptables")
	public static final String[] ADAPTABLE_CLASSES = { Resource.class.getName() };

	public <AdapterType> AdapterType getAdapter(Object adaptable,
			Class<AdapterType> adapterType) {

		if (adaptable instanceof Resource) {
			return getAdapter((Resource) adaptable, adapterType);
		}
		return null;
	}

	protected <AdapterType> AdapterType getAdapter(Resource resource,
			Class<AdapterType> adapterType) {

		if (null == resource) {
			LOG.error("Unable to adapt null resource {}");
			return null;
		}

		try {
			if (adapterType == COURSE_CLASS) {
				return (AdapterType) CoursePage.adaptFromResource(resource);
			}

		} catch (Exception e) {
			LOG.error("Unable to adapt to {} from resource {}", adapterType,
					resource.getPath());
		}
		return null;
	}

}
