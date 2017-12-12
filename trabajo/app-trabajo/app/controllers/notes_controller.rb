class NotesController < ApplicationController
  before_action :set_notes
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET exams/1/notes
  def index
    @notes = @exam.notes
  end

  # GET exams/1/notes/1
  def show
  end

  # GET exams/1/notes/new
  def new
    @note = @exam.notes.build
  end

  # GET exams/1/notes/1/edit
  def edit
  end

  # POST exams/1/notes
  def create
    @note = @exam.notes.build(note_params)

    if @note.save
      redirect_to([@note.exam, @note], notice: 'Note was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT exams/1/notes/1
  def update
    if @note.update_attributes(note_params)
      redirect_to([@note.exam, @note], notice: 'Note was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE exams/1/notes/1
  def destroy
    @note.destroy

    redirect_to exam_notes_url(@exam)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes
      @exam = Exam.find(params[:exam_id])
    end

    def set_note
      @note = @exam.notes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:score, :student_id)
    end
end
