# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def site_sections(current)
  [
    ['home',   '/',        ('active' if current.identifier == '/')],
    ['prices', '/prices',  ('active' if current.identifier =~ /^\/prices/)],
    ['about',  '/about/',  ('active' if current.identifier =~ /^\/about/)],
  ]
end

def external_links
  [
    # ['tweets',    'https://twitter.com/urbanautomaton'],
    # ['nonsense',  'http://www.deadbadger.net'],
  ]
end
