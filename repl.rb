class Array;def mi;i=0;map!{|t|x=yield(i,t);i+=1;x};end;end
def write;$chapters.each_index{|i|c=$chapters[i];File.open("chapters/chapter#{i+1}.tex", 'w'){|f|f.write c}};nil;end
def read;$chapters=(1..21).map{|i|File.read("chapters/chapter#{i}.tex")};end
def preview;$saved=read;write;end
def revert;$chapters=$saved;write;end
def replace(r,s=nil,&k);read;a=0;$chapters.mi{|i,x|x.gsub(r){$d=$~;a+=1;(k||lambda{|*o|t=$~;s.gsub(/\\(\d)/){t[$1.to_i]}}).call(i,x)||x}};a;end
