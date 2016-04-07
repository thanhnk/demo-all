package sg.wda;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;

public final class CodeUtil {
	private CodeUtil() {
	}

	public static String[] getEduOfTarAud(String code) {
		if (StringUtils.isNotEmpty(code)) {
			return code.split(":");
		}
		return new String[0];
	}

	public static String[] getJobLevel(String code) {
		if (StringUtils.isNotEmpty(code)) {
			String[] items = code.replace(" ", "").split(":");
			for (int i = 0, l = items.length; i < l; i++) {
				items[i] = jobLevels.get(Integer.valueOf(items[i]));
			}
			return items;
		}
		return new String[0];
	}

	public static String[] getMediumOfInstruction(String code) {
		if (StringUtils.isNotEmpty(code)) {
			code = code.replace("EL", "English").replace("MN", "Melanesian");
			return code.split(":");
		}
		return new String[0];
	}

	public static String[] getModeOfTraining(String code) {
		if (StringUtils.isNotEmpty(code)) {
			code = code.replace("FT", "Full Time").replace("PT", "Part Time")
					.replace("FP", "Full Time and Part Time");
			return code.split(":");
		}
		return new String[0];
	}

	public static String getAreaOfTrainingFromCode(String code) {
		if (StringUtils.isNotEmpty(code)) {
			Integer codeInt = Integer.valueOf(code);
			return areaOfTrainings.get(codeInt);
		}
		return "";
	}

	private static final Map<Integer, String> jobLevels = new HashedMap() {
		{
			put(1, "Senior Management");
			put(2, "Middle Management");
			put(3, "Junior Management");
			put(4, "Specialist");
			put(5, "Supervisory");
			put(6, "Operational");
		}
	};

	private static final Map<Integer, String> areaOfTrainings = new HashedMap() {
		{
			put(1, "Accounting, Banking & Finance");
			put(2, "Administration");
			put(3, "Advertising, Sales & Marketing");
			put(4, "Aerospace");
			put(5, "Agriculture and Fishing");
			put(6, "Architecture");
			put(7, "Arts and Entertainment");
			put(8, "Broadcasting , Publishing and Media");
			put(9, "Building and Construction");
			put(10, "Business Management");
			put(11, "Casino, Gambling and Betting");
			put(12, "Domestic Cleaning");
			put(13, "Environmental Cleaning");
			put(14, "Community and Social Services");
			put(15, "Customer Service");
			put(16, "Design");
			put(17, "Education and Training");
			put(18, "Electricity , Gas and Air-conditioning");
			put(19, "Engineering");
			put(20, "Fashion");
			put(21, "Food and Beverages");
			put(22, "Healthcare");
			put(23, "Hotel & Accommodation");
			put(24, "Human Resource Management, Employment and Recruitment");
			put(25, "Information and Communications");
			put(26, "Insurance");
			put(27, "Landscape");
			put(28, "Legal");
			put(29, "Manufacturing");
			put(30, "Marine & Port Services");
			put(31, "MICE & Events");
			put(32, "Mining and Quarrying");
			put(33, "Oil and Gas");
			put(34, "Personal Development");
			put(35, "Pharmaceutical and Biotechnology");
			put(36, "Procurement/Purchasing");
			put(37, "Productivity & Innovation");
			put(38, "Public Administration and Defence");
			put(39, "Real Estate");
			put(40, "Recreation and Attractions");
			put(41, "Repair and Maintenance");
			put(42, "Research & Product Development");
			put(43, "Security and Investigation");
			put(44, "Sports");
			put(45, "Telecommunications");
			put(46, "Tourism, Travel and Tour");
			put(47, "Transportation and Storage");
			put(48, "Veterinary, Pets and Animals");
			put(49, "Water Supply Sewerage and Waste Management");
			put(50, "Wholesale and Retail Trade");
			put(51, "Workplace Safety and Health");
			put(52, "Personal Services");
			put(53, "Audit/Risk Management");
			put(54,
					"Graphic Reproduction/Offset Printing/Mechanised Bookbinding");
			put(55, "Language Skills");
			put(56, "Process and Product Engineering");
			put(999, "Others");
		}
	};
}
