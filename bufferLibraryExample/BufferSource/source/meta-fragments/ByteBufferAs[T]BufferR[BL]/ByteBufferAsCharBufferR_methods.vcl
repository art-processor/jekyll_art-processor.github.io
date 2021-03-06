
    public String toString(int start, int end) {
	if ((end > limit()) || (start > end))
	    throw new IndexOutOfBoundsException();
	try {
	    int len = end - start;
	    char[] ca = new char[len];
	    CharBuffer cb = CharBuffer.wrap(ca);
	    CharBuffer db = this.duplicate();
	    db.position(start);
	    db.limit(end);
	    cb.put(db);
	    return new String(ca);
	} catch (StringIndexOutOfBoundsException x) {
	    throw new IndexOutOfBoundsException();
	}
    }

    // --- Methods to support CharSequence ---

    public CharSequence subSequence(int start, int end) {
	int len = length();
	int pos = position();
	assert (pos <= len);
	pos = (pos <= len \? pos : len);

	if ((start < 0) || (end > len) || (start > end))
	    throw new IndexOutOfBoundsException();
	int sublen = end - start;
 	int off = offset + ((pos + start) << ?@elmtSize?);
	return new ByteBufferAsCharBufferR?@ByteOrder?(bb, -1, 0, sublen, sublen, off);
    }
