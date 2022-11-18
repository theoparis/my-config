local cmd = os.getenv('FFMPEG_CMD') or 'ffmpeg'
local gpu_device = os.getenv('FFMPEG_GPU')
local x11_capture = os.getenv(
local cmd_args = {}

if gpu_device then
	table.insert(cmd_args, '-hwaccel=vapi')
	table.insert(cmd_args, '-hwaccel_output_format=vaapi')
	table.insert(cmd_args, '-vaapi_device=' .. gpu_device)
end

--local
---vaapi_device /dev/dri/renderD129
---hwaccel vaapi
---hwaccel_output_format vaapi
---f x11grab
---s 1920x1080
---i :0.0
---vf 'format=nv12,hwupload'
---vf 'deinterlace_vaapi,scale_vaapi=w=1920:h=1080,hwdownload,format=nv12'
---c:v vp9_vaapi
---c:a libopus
--output.webm
--]])
