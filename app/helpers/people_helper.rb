module PeopleHelper
  def person_initials(ln,fn,sn)
    "#{ln.capitalize + " " +
    fn.first.capitalize + "." +
    sn.first.capitalize + "."}"
  end
end
