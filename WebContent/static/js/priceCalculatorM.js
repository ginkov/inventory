/**
 * 自动计算商品的总价
 * 在 Mobile 环境下，由于屏幕尺寸的原因，只有
 *  产品
 *  数量
 *  实际单价
 *  小计
 * 四个参数。
 */

//	function updateListPrice(id){
//		var dbid = $('#prod'+id).val();
//		$('#listprice'+id).val(Number(pricelist[dbid]).toFixed(2));
//	}
//	function updateDiscount(id){
//		var listprice = $('#listprice'+id).val();
//		var discountprice = $('#discountprice'+id).val();
//		$('#discount'+id).val(Number(discountprice/listprice).toFixed(2));
//	}
	function updateDiscountPrice(id){
		var dbid = $('#prod'+id).val();
		$('#discountprice'+id).val(Number(pricelist[dbid]).toFixed(2));
	}
	function updateSubtotal(id){
		var qty = $('#qty'+id).val();
		var discountprice = $('#discountprice'+id).val();
		$('#subtotal'+id).val(Number(qty*discountprice).toFixed(2));
	}
	function setQty(id, v) {
		$('#qty'+id).val(v)
	}
	//=================
	function productChanged(id){
		updateDiscountPrice(id);
		setQty(id,1);
		updateSubtotal(id);
	}
	function qtyChanged(id){
//		updateListPrice(id);
		updateDiscountPrice(id);
		updateSubtotal(id);
	}
//	function discountChanged(id){
//		updateDiscountPrice(id);
//		updateSubtotal(id);
//	}
	function discountPriceChanged(id){
//		updateDiscount(id);
		updateSubtotal(id);
	}