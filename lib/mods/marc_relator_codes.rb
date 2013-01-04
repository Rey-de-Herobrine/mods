# Represents the Marc Relator Codes mapped to Relators, from http://www.loc.gov/marc/relators/relacode.html 2012-12
#  key - Marc Relator code
#  value - Marc Relator term
MARC_RELATOR = {
  'acp' => 'Art copyist',
  'act' => 'Actor',
  'adp' => 'Adapter',
  'aft' => 'Author of afterword, colophon, etc.',
  'anl' => 'Analyst',
  'anm' => 'Animator',
  'ann' => 'Annotator',
  'ant' => 'Bibliographic antecedent',
  'app' => 'Applicant',
  'aqt' => 'Author in quotations or text abstracts',
  'arc' => 'Architect',
  'ard' => 'Artistic director',
  'arr' => 'Arranger',
  'art' => 'Artist',
  'asg' => 'Assignee',
  'asn' => 'Associated name',
  'att' => 'Attributed name',
  'auc' => 'Auctioneer',
  'aud' => 'Author of dialog',
  'aui' => 'Author of introduction',
  'aus' => 'Author of screenplay',
  'aut' => 'Author',
  'bdd' => 'Binding designer',
  'bjd' => 'Bookjacket designer',
  'bkd' => 'Book designer',
  'bkp' => 'Book producer',
  'blw' => 'Blurb writer',
  'bnd' => 'Binder',
  'bpd' => 'Bookplate designer',
  'bsl' => 'Bookseller',
  'ccp' => 'Conceptor',
  'chr' => 'Choreographer',
  'clb' => 'Collaborator',
  'cli' => 'Client',
  'cll' => 'Calligrapher',
  'clr' => 'Colorist',
  'clt' => 'Collotyper',
  'cmm' => 'Commentator',
  'cmp' => 'Composer',
  'cmt' => 'Compositor',
  'cng' => 'Cinematographer',
  'cnd' => 'Conductor',
  'cns' => 'Censor',
  'coe' => 'Contestant -appellee',
  'col' => 'Collector',
  'com' => 'Compiler',
  'con' => 'Conservator',
  'cos' => 'Contestant',
  'cot' => 'Contestant -appellant',
  'cov' => 'Cover designer',
  'cpc' => 'Copyright claimant',
  'cpe' => 'Complainant-appellee',
  'cph' => 'Copyright holder',
  'cpl' => 'Complainant',
  'cpt' => 'Complainant-appellant',
  'cre' => 'Creator',
  'crp' => 'Correspondent',
  'crr' => 'Corrector',
  'csl' => 'Consultant',
  'csp' => 'Consultant to a project',
  'cst' => 'Costume designer',
  'ctb' => 'Contributor',
  'cte' => 'Contestee-appellee',
  'ctg' => 'Cartographer',
  'ctr' => 'Contractor',
  'cts' => 'Contestee',
  'ctt' => 'Contestee-appellant',
  'cur' => 'Curator',
  'cwt' => 'Commentator for written text',
  'dfd' => 'Defendant',
  'dfe' => 'Defendant-appellee',
  'dft' => 'Defendant-appellant',
  'dgg' => 'Degree grantor',
  'dis' => 'Dissertant',
  'dln' => 'Delineator',
  'dnc' => 'Dancer',
  'dnr' => 'Donor',
  'dpb' => 'Distribution place',
  'dpc' => 'Depicted',
  'dpt' => 'Depositor',
  'drm' => 'Draftsman',
  'drt' => 'Director',
  'dsr' => 'Designer',
  'dst' => 'Distributor',
  'dtc' => 'Data contributor',
  'dte' => 'Dedicatee',
  'dtm' => 'Data manager',
  'dto' => 'Dedicator',
  'dub' => 'Dubious author',
  'edt' => 'Editor',
  'egr' => 'Engraver',
  'elg' => 'Electrician',
  'elt' => 'Electrotyper',
  'eng' => 'Engineer',
  'etr' => 'Etcher',
  'evp' => 'Event place',
  'exp' => 'Expert',
  'fac' => 'Facsimilist',
  'fld' => 'Field director',
  'flm' => 'Film editor',
  'fmo' => 'Former owner',
  'fpy' => 'First party',
  'fnd' => 'Funder',
  'frg' => 'Forger',
  'gis' => 'Geographic information specialist',
  'grt' => 'Graphic technician',
  'hnr' => 'Honoree',
  'hst' => 'Host',
  'ill' => 'Illustrator',
  'ilu' => 'Illuminator',
  'ins' => 'Inscriber',
  'inv' => 'Inventor',
  'itr' => 'Instrumentalist',
  'ive' => 'Interviewee',
  'ivr' => 'Interviewer',
  'lbr' => 'Laboratory',
  'lbt' => 'Librettist',
  'ldr' => 'Laboratory director',
  'led' => 'Lead',
  'lee' => 'Libelee-appellee',
  'lel' => 'Libelee',
  'len' => 'Lender',
  'let' => 'Libelee-appellant',
  'lgd' => 'Lighting designer',
  'lie' => 'Libelant-appellee',
  'lil' => 'Libelant',
  'lit' => 'Libelant-appellant',
  'lsa' => 'Landscape architect',
  'lse' => 'Licensee',
  'lso' => 'Licensor',
  'ltg' => 'Lithographer',
  'lyr' => 'Lyricist',
  'mcp' => 'Music copyist',
  'mfp' => 'Manufacture place',
  'mfr' => 'Manufacturer',
  'mdc' => 'Metadata contact',
  'mod' => 'Moderator',
  'mon' => 'Monitor',
  'mrb' => 'Marbler',
  'mrk' => 'Markup editor',
  'msd' => 'Musical director',
  'mte' => 'Metal-engraver',
  'mus' => 'Musician',
  'nrt' => 'Narrator',
  'opn' => 'Opponent',
  'org' => 'Originator',
  'orm' => 'Organizer of meeting',
  'oth' => 'Other',
  'own' => 'Owner',
  'pat' => 'Patron',
  'pbd' => 'Publishing director',
  'pbl' => 'Publisher',
  'pdr' => 'Project director',
  'pfr' => 'Proofreader',
  'pht' => 'Photographer',
  'plt' => 'Platemaker',
  'pma' => 'Permitting agency',
  'pmn' => 'Production manager',
  'pop' => 'Printer of plates',
  'ppm' => 'Papermaker',
  'ppt' => 'Puppeteer',
  'prc' => 'Process contact',
  'prd' => 'Production personnel',
  'prf' => 'Performer',
  'prg' => 'Programmer',
  'prm' => 'Printmaker',
  'pro' => 'Producer',
  'prp' => 'Production place',
  'prt' => 'Printer',
  'pta' => 'Patent applicant',
  'pte' => 'Plaintiff -appellee',
  'ptf' => 'Plaintiff',
  'pth' => 'Patent holder',
  'ptt' => 'Plaintiff-appellant',
  'pup' => 'Publication place',
  'rbr' => 'Rubricator',
  'rce' => 'Recording engineer',
  'rcp' => 'Recipient',
  'red' => 'Redactor',
  'ren' => 'Renderer',
  'res' => 'Researcher',
  'rev' => 'Reviewer',
  'rps' => 'Repository',
  'rpt' => 'Reporter',
  'rpy' => 'Responsible party',
  'rse' => 'Respondent-appellee',
  'rsg' => 'Restager',
  'rsp' => 'Respondent',
  'rst' => 'Respondent-appellant',
  'rth' => 'Research team head',
  'rtm' => 'Research team member',
  'sad' => 'Scientific advisor',
  'sce' => 'Scenarist',
  'scl' => 'Sculptor',
  'scr' => 'Scribe',
  'sds' => 'Sound designer',
  'sec' => 'Secretary',
  'sgn' => 'Signer',
  'sht' => 'Supporting host',
  'sng' => 'Singer',
  'spk' => 'Speaker',
  'spn' => 'Sponsor',
  'spy' => 'Second party',
  'srv' => 'Surveyor',
  'std' => 'Set designer',
  'stl' => 'Storyteller',
  'stm' => 'Stage manager',
  'stn' => 'Standards body',
  'str' => 'Stereotyper',
  'tcd' => 'Technical director',
  'tch' => 'Teacher',
  'ths' => 'Thesis advisor',
  'trc' => 'Transcriber',
  'trl' => 'Translator',
  'tyd' => 'Type designer',
  'tyg' => 'Typographer',
  'uvp' => 'University place',
  'vdg' => 'Videographer',
  'voc' => 'Vocalist',
  'wam' => 'Writer of accompanying material',
  'wdc' => 'Woodcutter',
  'wde' => 'Wood-engraver',
  'wit' => 'Witness'
}