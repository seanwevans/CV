cv = {
  name      = [[Sean W. Evans]],
  email     = [[Sean@SeanWEvans.com]],
  phone     = [[+1 (516) 330-2517]],
  website   = [[https://SeanWEvans.com]],
  github    = [[https://github.com/SeanWEvans]],
  linkedin  = [[https://www.linkedin.com/in/sean-evans-49398229b/]],

  summary = [[Systems-level engineer with 6+ years building end-to-end ML, vision, and
    document-analysis pipelines, with experience in C/C++/CUDA, runtime systems,
    Postgres tooling, and mathematical modeling. Specializes in rapid prototyping
    across abstraction layers (theory → GPU → product), workflow automation, and
    shipping high-reliability systems at scale.]],

  skills = {
    {
      category = [[Languages]],
      items    = { [[Python]], [[C]], [[C++]], [[CUDA]], [[C\#]], [[Perl]], [[SQL (Postgres/T-SQL)]] }
    },
    {
      category = [[Machine Learning]],
      items    = { [[PyTorch]], [[TensorFlow]], [[Detectron2]], [[CNN/RNN OCR]], [[SpaCy]] }
    },
    {
      category = [[Computer Vision]],
      items    = { [[OpenCV]], [[document segmentation]], [[structural analysis]] }
    },
    {
      category = [[Systems \& Performance]],
      items    = { [[Linux]], [[Git]], [[Make/CMake]], [[multiprocessing]], [[GPU kernels]] }
    },
    {
      category = [[Data \& SDKs]],
      items    = { [[PostgreSQL]], [[XML (DOM/SAX)]], [[PDF libraries]], [[MS Office SDK]], [[Adobe SDK]] }
    },
    {
      category = [[Scientific \& Typesetting]],
      items    = { [[LaTeX]], [[MathJax]], [[numerical modeling]], [[geometry]] }
    }
  },

  experience = {
    {
      company  = [[Data Conversion Laboratory]],
      location = [[Remote]],
      title    = [[Machine Learning Engineer]],
      dates    = [[May 2021 -- Feb 2025]],
      bullets  = {
        [[Designed a Detectron2-based document segmentation pipeline reducing manual classification by 50\%.]],
        [[Built a CNN–RNN LaTeX OCR system with near state-of-the-art accuracy.]],
        [[Automated document styling using NLP + MS Office SDK, reducing a 40-hour workflow to 2 hours.]],
        [[Implemented an OpenCV-based checkbox detector achieving >96\% accuracy across thousands of formats.]],
        [[Developed high-throughput pipelines capable of millions of pages per week.]]
      }
    },
    {
      company  = [[Data Conversion Laboratory]],
      location = [[Remote]],
      title    = [[Software Engineer]],
      dates    = [[Sep 2020 -- May 2021]],
      bullets  = {
        [[Built PDF cleaning and OCR preprocessing system capable of 100k+ pages per week per server.]],
        [[Automated LaTeX and JATS XML correction workflow replacing a full-time manual process.]],
        [[Developed .docx → XML converter using MS Office InterOp.]],
        [[Delivered reliable production tooling using TDD, Agile, and robust XML parsing.]]
      }
    },
    {
      company  = [[Data Conversion Laboratory]],
      location = [[Queens, NY]],
      title    = [[Lead Technology Analyst]],
      dates    = [[Sep 2019 -- Sep 2020]],
      bullets  = {
        [[Led workflow optimization initiatives, mentored engineers, and coordinated with stakeholders.]]
      }
    },
    {
      company  = [[Data Conversion Laboratory]],
      location = [[Queens, NY]],
      title    = [[Technology Analyst]],
      dates    = [[May 2018 -- Sep 2019]],
      bullets  = {
        [[Developed custom data-conversion tools for large-scale migrations.]],
        [[Maintained and improved high-volume pipelines for enterprise clients.]]
      }
    }
  },

  education = {
    {
      institution = [[Long Island University]],
      degree      = [[Bachelor of Science in Mathematics]],
      dates       = [[2003--2026]]
    }
  }
}

os.execute("mkdir -p build")
local NL = string.char(10)

local function tex_unescape(s)
  s = tostring(s)
  -- order matters a bit less here, but keep it simple
  s = s:gsub("\\%%", "%%")   -- \%  -> %
  s = s:gsub("\\&", "&")     -- \&  -> &
  s = s:gsub("\\#", "#")     -- \#  -> #
  s = s:gsub("\\_", "_")     -- \_  -> _
  return s
end

local function plain(s)
  return tex_unescape(s)
end

local function json_escape(s)
  s = plain(s)
  s = s:gsub([[\\]], [[\\\\]])  -- backslash
  s = s:gsub([["]], [[\"]])    -- quote
  s = s:gsub(NL, [[\\n]])      -- newline
  return s
end

local function yaml_escape(s)
  s = plain(s)
  s = s:gsub([[\\]], [[\\\\]])
  s = s:gsub([["]], [[\\"]])
  return s
end

local function html_escape(s)
  s = plain(s)
  s = s:gsub("&", "&amp;")
  s = s:gsub("<", "&lt;")
  s = s:gsub(">", "&gt;")
  return s
end


-- Markdown
do
  local md = io.open("build/cv.md", "w")
  md:write("# " .. plain(cv.name) .. NL .. NL)
  md:write(
    "## 🌐 ["..plain(cv.website).."]("..plain(cv.website)..") • ✉️ ["..plain(cv.email).."]" ..
    "(mailto:"..plain(cv.email)..") • [Github]("..plain(cv.github)..") • [LinkedIn]("..
    plain(cv.linkedin)..")" .. NL .. NL
  )
  md:write("---" .. NL .. NL .. "## Summary" .. NL .. plain(cv.summary) .. NL .. NL)
  md:write("---" .. NL .. NL .. "## Skills" .. NL)
  for _, s in ipairs(cv.skills) do
    md:write("### " .. plain(s.category) .. NL)
    local items_plain = {}
    for i, it in ipairs(s.items) do
      items_plain[i] = plain(it)
    end
    md:write("- " .. table.concat(items_plain, ", ") .. NL .. NL)
  end

  md:write("---" .. NL .. NL .. "## Experience" .. NL)
  for _, e in ipairs(cv.experience) do
    md:write("### **" .. plain(e.company) .. " — " .. plain(e.location) .. "**" .. NL)
    md:write("#### *" .. plain(e.title) .. " (" .. plain(e.dates) .. ")*" .. NL)
    for _, b in ipairs(e.bullets) do
      md:write("- " .. plain(b) .. NL)
    end
    md:write(NL)
  end

  md:write("---" .. NL .. NL .. "## Education" .. NL)
  for _, ed in ipairs(cv.education) do
    md:write("### **" .. plain(ed.institution) .. "**" .. NL)
    md:write("- " .. plain(ed.degree) .. " (" .. plain(ed.dates) .. ")" .. NL .. NL)
  end
  md:close()
end


-- Plain text
do
  local txt = io.open("build/cv.txt", "w")
  txt:write(plain(cv.name) .. NL)
  txt:write("Email: " .. plain(cv.email) .. NL)
  txt:write("Phone: " .. plain(cv.phone) .. NL)
  txt:write("Website: " .. plain(cv.website) .. NL)
  txt:write("Github: " .. plain(cv.github) .. NL)
  txt:write("LinkedIn: " .. plain(cv.linkedin) .. NL .. NL)
  txt:write("SUMMARY" .. NL .. "--------" .. NL .. plain(cv.summary) .. NL .. NL)
  txt:write("SKILLS" .. NL .. "------" .. NL)
  for _, s in ipairs(cv.skills) do
    local items_plain = {}
    for i, it in ipairs(s.items) do
      items_plain[i] = plain(it)
    end
    txt:write(plain(s.category) .. ": " .. table.concat(items_plain, ", ") .. NL)
  end
  txt:write(NL .. "EXPERIENCE" .. NL .. "----------" .. NL)
  for _, e in ipairs(cv.experience) do
    txt:write(plain(e.company) .. " — " .. plain(e.location) .. NL)
    txt:write(plain(e.title) .. " (" .. plain(e.dates) .. ")" .. NL)
    for _, b in ipairs(e.bullets) do
      txt:write("  - " .. plain(b) .. NL)
    end
    txt:write(NL)
  end
  txt:write("EDUCATION" .. NL .. "---------" .. NL)
  for _, ed in ipairs(cv.education) do
    txt:write(plain(ed.institution) .. " — " .. plain(ed.degree) ..
              " (" .. plain(ed.dates) .. ")" .. NL)
  end
  txt:close()
end


-- JSON
do
  local jf = io.open("build/cv.json", "w")
  local function jstr(s) return '"' .. json_escape(s) .. '"' end

  jf:write("{" .. NL)
  jf:write('  "name": '     .. jstr(cv.name)     .. "," .. NL)
  jf:write('  "email": '    .. jstr(cv.email)    .. "," .. NL)
  jf:write('  "phone": '    .. jstr(cv.phone)    .. "," .. NL)
  jf:write('  "website": '  .. jstr(cv.website)  .. "," .. NL)
  jf:write('  "github": '   .. jstr(cv.github)   .. "," .. NL)
  jf:write('  "linkedin": ' .. jstr(cv.linkedin) .. "," .. NL)
  jf:write('  "summary": '  .. jstr(cv.summary)  .. "," .. NL)

  -- skills
  jf:write('  "skills": [' .. NL)
  local first_skill = true
  for _, s in ipairs(cv.skills) do
    if not first_skill then jf:write("," .. NL) end
    first_skill = false

    jf:write('    {"category": ' .. jstr(s.category) .. ', "items": [')
    local first_item = true
    for _, it in ipairs(s.items) do
      if not first_item then jf:write(", ") end
      first_item = false
      jf:write(jstr(it))
    end
    jf:write("]}")
  end
  jf:write(NL .. "  ]," .. NL)

  -- experience
  jf:write('  "experience": [' .. NL)
  local first_exp = true
  for _, e in ipairs(cv.experience) do
    if not first_exp then jf:write("," .. NL) end
    first_exp = false

    jf:write(
      '    {"company": '  .. jstr(e.company)  ..
      ', "location": '   .. jstr(e.location) ..
      ', "title": '      .. jstr(e.title)    ..
      ', "dates": '      .. jstr(e.dates)    ..
      ', "bullets": ['
    )
    local first_b = true
    for _, b in ipairs(e.bullets) do
      if not first_b then jf:write(", ") end
      first_b = false
      jf:write(jstr(b))
    end
    jf:write("]}")
  end
  jf:write(NL .. "  ]," .. NL)

  -- education
  jf:write('  "education": [' .. NL)
  local first_ed = true
  for _, ed in ipairs(cv.education) do
    if not first_ed then jf:write("," .. NL) end
    first_ed = false
    jf:write(
      '    {"institution": ' .. jstr(ed.institution) ..
      ', "degree": '         .. jstr(ed.degree)      ..
      ', "dates": '          .. jstr(ed.dates)       ..
      "}"
    )
  end
  jf:write(NL .. "  ]" .. NL)
  jf:write("}" .. NL)
  jf:close()
end


-- YAML
do
  local yf = io.open("build/cv.yaml", "w")
  local function ystr(s) return '"' .. yaml_escape(s) .. '"' end

  yf:write("name: "     .. ystr(cv.name)     .. NL)
  yf:write("email: "    .. ystr(cv.email)    .. NL)
  yf:write("phone: "    .. ystr(cv.phone)    .. NL)
  yf:write("website: "  .. ystr(cv.website)  .. NL)
  yf:write("github: "   .. ystr(cv.github)   .. NL)
  yf:write("linkedin: " .. ystr(cv.linkedin) .. NL)

  -- summary as block literal (plain, not yaml_escape)
  yf:write("summary: |" .. NL)
  local summary = plain(cv.summary)
  if summary:sub(-1) ~= NL then
    summary = summary .. NL
  end
  for line in summary:gmatch("([^" .. NL .. "]*)" .. NL) do
    yf:write("  " .. line .. NL)
  end

  yf:write("skills:" .. NL)
  for _, s in ipairs(cv.skills) do
    yf:write("  - category: " .. ystr(s.category) .. NL)
    yf:write("    items:" .. NL)
    for _, it in ipairs(s.items) do
      yf:write("      - " .. ystr(it) .. NL)
    end
  end

  yf:write("experience:" .. NL)
  for _, e in ipairs(cv.experience) do
    yf:write("  - company: " .. ystr(e.company)  .. NL)
    yf:write("    location: " .. ystr(e.location) .. NL)
    yf:write("    title: "    .. ystr(e.title)    .. NL)
    yf:write("    dates: "    .. ystr(e.dates)    .. NL)
    yf:write("    bullets:" .. NL)
    for _, b in ipairs(e.bullets) do
      yf:write("      - " .. ystr(b) .. NL)
    end
  end

  yf:write("education:" .. NL)
  for _, ed in ipairs(cv.education) do
    yf:write("  - institution: " .. ystr(ed.institution) .. NL)
    yf:write("    degree: "      .. ystr(ed.degree)      .. NL)
    yf:write("    dates: "       .. ystr(ed.dates)       .. NL)
  end

  yf:close()
end


-- HTML
do
  local hf = io.open("build/cv.html", "w")
  local function hwrite(s) hf:write(s) end

  hwrite("<!doctype html>" .. NL)
  hwrite("<html><head><meta charset=\"utf-8\"><title>" ..
         html_escape(cv.name) .. "</title></head><body>" .. NL)

  hwrite("<h1>" .. html_escape(cv.name) .. "</h1>" .. NL)
  hwrite("<p>")
  hwrite("<a href=\"mailto:" .. html_escape(cv.email) .. "\">" .. html_escape(cv.email) .. "</a> | ")
  hwrite("<a href=\"" .. html_escape(cv.website) .. "\">" .. html_escape(cv.website) .. "</a> | ")
  hwrite("<a href=\"" .. html_escape(cv.github) .. "\">Github</a> | ")
  hwrite("<a href=\"" .. html_escape(cv.linkedin) .. "\">LinkedIn</a>")
  hwrite("</p>" .. NL)

  hwrite("<h2>Summary</h2>" .. NL)
  local sum_html = html_escape(cv.summary)
  sum_html = sum_html:gsub(NL, "<br>" .. NL)
  hwrite("<p>" .. sum_html .. "</p>" .. NL)

  hwrite("<h2>Skills</h2>" .. NL)
  for _, s in ipairs(cv.skills) do
    local items_plain = {}
    for i, it in ipairs(s.items) do
      items_plain[i] = plain(it)
    end
    hwrite("<h3>" .. html_escape(s.category) .. "</h3>" .. NL)
    hwrite("<p>" .. html_escape(table.concat(items_plain, ", ")) .. "</p>" .. NL)
  end

  hwrite("<h2>Experience</h2>" .. NL)
  for _, e in ipairs(cv.experience) do
    hwrite("<h3>" .. html_escape(e.title) .. " — " .. html_escape(e.company) .. "</h3>" .. NL)
    hwrite("<p><em>" .. html_escape(e.location) .. " (" .. html_escape(e.dates) .. ")</em></p>" .. NL)
    hwrite("<ul>" .. NL)
    for _, b in ipairs(e.bullets) do
      hwrite("<li>" .. html_escape(b) .. "</li>" .. NL)
    end
    hwrite("</ul>" .. NL)
  end

  hwrite("<h2>Education</h2>" .. NL)
  for _, ed in ipairs(cv.education) do
    hwrite("<h3>" .. html_escape(ed.institution) .. "</h3>" .. NL)
    hwrite("<p>" .. html_escape(ed.degree) .. " (" .. html_escape(ed.dates) .. ")</p>" .. NL)
  end

  hwrite("</body></html>" .. NL)
  hf:close()
end
