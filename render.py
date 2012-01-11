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

    with open(out, 'w') as outf:
        with open(template) as f:
            post_tag = False
            for line in f:
                m = tag_re.match(line)
                if m:
                    tag = m.group(1).strip()
                    if tag in data:
                        outf.write(data[tag])
                        post_tag = True
                else:
                    if post_tag and re.match(r'^[^\s]', line):
                        # skip placeholder data
                        pass
                    else:
                        post_tag = False
                        outf.write(line)
                   
                  



if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2 or not sys.argv[1].endswith('.out'):
        sys.stderr.write("Usage: %s data.out\n" % sys.argv[0])
        sys.exit(1)

    inp = sys.argv[1]
    prefix = inp[:-len('.out')]
    out = prefix + '.html'
    render(inp, out)
