class AttendancesController < ApplicationController
  before_filter :authenticate, :only => [:create, :update, :delete]
  after_filter :logged_out, :only => [:create, :update, :delete]
  
 
  # GET /attendances
  # GET /attendances.xml
  def index
    @students = Student.find(:all, :order => "last_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.xml
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.xml
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.xml
  def create
    @students = Student.find(:all, :order => "last_name")
    @students.each { |student|
      num_classes = 0
      params["student#{student.id}"].each {|key, value|
        num_classes += value.to_i();
      }
      if (num_classes > 0) 
        attendance = Attendance.new(:student_id => student.id, 
                                   :number_of_classes => num_classes)
        attendance.save
      end
      
    }
 
    respond_to do |format|
        flash.now[:notice] = 'Attendance was successfully created.'
        format.html { render :action => "index" }
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.xml
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        flash[:notice] = 'Attendance was successfully updated.'
        format.html { redirect_to(@attendance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.xml
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to(attendances_url) }
      format.xml  { head :ok }
    end
  end
end
