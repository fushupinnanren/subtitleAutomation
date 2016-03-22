import subtitles


def file_ext(file_name):
    return file_name[file_name.rfind('.') + 1:]


def file_base(file_name):
    return file_name[:file_name.rfind('.')]


def write_file(file_name, str_):
    try:
        open(file_name, 'wb').write(str_)
    except Exception, e:
        raise SystemExit("Error writing to %s: %s" % (file_name, e))


def default_output_format():
    if subtitles.options['download'] == 'all':
        return "%m.%L.%I.%S"
    elif subtitles.options['lang'] == 'all' or ',' in subtitles.options['lang']:
        return "%m.%L.%S"
    else:
        return "%m.%S"