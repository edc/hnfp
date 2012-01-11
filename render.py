# to be called from make to translate .out file to .html
import re
TEMPLATE = 'index.html.t'

def render(inp, out, template=TEMPLATE):
    """render using data in <inp> and generate output to <out>"""
    tag_re = re.compile(r'<!--+(.*)-->')
    data, tag = {}, None
    with open(inp) as f:
        buf = []
        for line in f:
            m = tag_re.match(line)
            if m:
                # finish the previous tag
                if tag:
                    data[tag] = ''.join(buf)
                tag = m.group(1).strip()
                buf = [line]
            else:
                buf.append(line)
        data[tag] = ''.join(buf)
    print data


if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2 or not sys.argv[1].endswith('.out'):
        sys.stderr.write("Usage: %s data.out" % sys.argv[0])
        sys.exit(1)

    inp = sys.argv[1]
    prefix = inp[:len('.out')]
    out = prefix + '.html'
    render(inp, out)
