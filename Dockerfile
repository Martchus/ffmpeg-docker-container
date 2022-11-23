FROM	opensuse/tumbleweed

ENV ZYPPER_PACKAGES="ffmpeg-5 libass9 \
		libopus0 libogg0 libvorbis0 libmp3lame0 libfdk-aac2 \
		libwebp7 \
		libvpx7 x264 x265 libaom3 dav1d librav1e0 libSvtAv1Enc1"

RUN	zypper ar -cfp 90 http://ftp.uni-erlangen.de/packman/suse/openSUSE_Tumbleweed packman && \
	zypper --gpg-auto-import-keys ref && zypper --non-interactive dup --allow-vendor-change --allow-downgrade && \
	zypper --non-interactive install --recommends --allow-vendor-change --allow-downgrade $ZYPPER_PACKAGES && \
	zypper clean -a

ENTRYPOINT	["ffmpeg"]
CMD		["-version"]
