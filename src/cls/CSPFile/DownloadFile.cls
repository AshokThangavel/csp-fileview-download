/// View the file from the server
Class CSPFile.DownloadFile Extends %CSP.Page
{

Parameter DirDelimiter As STRING = "\";

ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	#dim %response as %CSP.Response
	
	kill %dirNotExist,%fileNotExist,%file
  	set %file=$Get(%request.Data("file",1),"")
  	If %file]"" {
	  	set %file = $$$FileNormalizeFilename(%file)
	  	set directory = $Piece(%file,..#DirDelimiter,1,*-1)
	  	set file = $Piece(%file,..#DirDelimiter,*)
	  	If '$$$FileDirectoryExists(directory) Set %dirNotExist=1 Return $$$OK
	  	If '$$$FileExists(%file) Set %fileNotExist=1 Return $$$OK
	  	set stream=##class(%Stream.FileCharacter).%New()
	  	set sc=stream.LinkToFile(%file)
	    set %stream = stream
	    set %response.ContentLength=stream.Size
	    do %response.SetHeader("Content-Disposition","attachment; filename="""_file_"""")

  	}
  	return $$$OK
}

ClassMethod OnPage() As %Status
{
	if '$Length(%file) {
		&html<<b>Filename is empty Can you pass the filename as a parameter ex(file=dir\file.txt)</b>>  
	}
	if $data(%dirNotExist) {
		&html<<b>Directory not exist on the server</b>>
	}
	If $data(%fileNotExist) {
		&html<<b>File not exist on the server</b>>
	} 
	set %response.ContentType = "application/text"
	id $data(%stream) {
  		do:$IsObject(%stream) %stream.OutputToDevice()
	}
  	return $$$OK
}

}
