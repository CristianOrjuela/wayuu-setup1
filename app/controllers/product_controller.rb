class ProductController < ApplicationController
  def add
    @cate = Category.all.order('name ASC')
  end

  def new
    name = params['product_name']
    description = params['product_description']
    model = params['model']
    price = params['price']
    tax_class_id = params['tax_class_id']
    quantity = params['quantity']
    length = params['length']
    width = params['width']
    height = params['height']
    status = params['status']
    category1 = params['category1']
    @cat = Category.find_by name: category1.to_s
    product_discount_price = params['product_discount_price']
    product_discount_start = params['product_discount_start']
    product_discount_end = params['product_discount_end']

    puts @cat.id

    temp = Product.new
    temp.name = name
    temp.quantity = quantity.to_i
    temp.price = price.to_f
    temp.length = length.to_f
    temp.width = width.to_f
    temp.height = height.to_f
    temp.status = status
    temp.description = description

    temp.save!

    catego = CategoryHasProduct.new
    catego.product = temp
    catego.category = cat
    catego.save!

    #redirect_to '/admin/index'
    @imagen = params['images']
  end

  def show
    @list = Product.all.order("id ASC")
    @consult = CategoryHasProduct.all
  end

  def edit
    @cate = Product.find( params[:id] )
  end

  def update
    @cate = Category.find( params[:id] )
    @cate.name = params['category_name']
    @cate.description = params['category_description']
    @cate.save!
    redirect_to '/admin/category/show'
  end


  def update
    @cate = Category.find( params[:id] )
    @cate.name = params['category_name']
    @cate.description = params['category_description']
    @cate.save!
    redirect_to '/admin/category/show'
  end

end
