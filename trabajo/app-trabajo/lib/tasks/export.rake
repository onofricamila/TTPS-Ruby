namespace :export do
    desc "Prints Course.all in a seeds.rb way."
    task :seeds_format => :environment do
        puts ''
        Course.order(:id).all.each do |course|
            puts "Course.create(#{course.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
    end
    
    desc "Prints Exam.all in a seeds.rb way."
    task :seeds_format => :environment do
        puts ''
        Exam.order(:id).all.each do |exam|
            puts "Exam.create(#{exam.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
    end
    
    desc "Prints Student.all in a seeds.rb way."
    task :seeds_format => :environment do
        puts ''
        Student.order(:id).all.each do |std|
            puts "Student.create(#{std.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
    end

    desc "Prints Result.all in a seeds.rb way."
    task :seeds_format => :environment do
        puts ''
        Result.order(:id).all.each do |res|
            puts "Result.create(#{res.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
    end
end