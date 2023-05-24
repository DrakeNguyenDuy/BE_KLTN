package com.salesmanager.shop.model.catalog.product.type;

public class PersistableProductType extends ProductTypeEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	Long hide some lines here(23/5/2023)
//	private List<ProductTypeDescription> descriptions;
//	end
	
//	Long add some lines here(23/5/2023)
	private String code;
	private String name;
//	end

//	Long hide some lines here(23/5/2023)
//	public List<ProductTypeDescription> getDescriptions() {
//		return descriptions;
//	}
//	public void setDescriptions(List<ProductTypeDescription> descriptions) {
//		this.descriptions = descriptions;
//	}
//	end
	
//	Long add some lines here(23/5/2023)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	end

}
