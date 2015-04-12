class LectureController < ApplicationController

  def list
    @data = []
    data = {}

    data[:pic] = "https://s3-ap-northeast-1.amazonaws.com/i.schoo/images/teacher/60.jpg"
    data[:title] = "無駄のない起業入門"
    data[:sentence] = "シリコンバレーの手法を日本的にアレンジ"
    @data << data

    data = {}
    data[:pic] = "http://oops-study.com/wp-content/uploads/2013/01/paul_graham.jpg"
    data[:title] = "無駄のない起業入門"
    data[:sentence] = "シリコンバレーの手法を日本的にアレンジ"
    @data << data

    data = {}
    data[:pic] = "http://diamond.jp/mwimgs/b/9/250/img_b9ff98ee6b36ef9a62fe79981fbca3cd379467.jpg"
    data[:title] = ""
    data[:sentence] = "シリコンバレーの手法を日本的にアレンジ"
    @data << data

  end
end










