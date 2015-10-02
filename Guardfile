ignore /^node_modules/, /^build/, /^typings/, /^bower_components/

guard :shell do
  watch %r[\.cr$] do |m|
    puts "#{Time.now}: #{m[0]}"
    if m[0] =~ /_spec\.cr$/
      system "crystal spec #{m[0]}"
    else
      system "crystal build #{m[0]}"
    end
  end
end
