package Entity;

public class Log {
    private String readerid;
    private String service;
    private String bookid;
    private String borrowtime;
    private int borrowday;
    private String complete;

    public Log() {
    }

    public String getReaderid() {
        return readerid;
    }

    public void setReaderid(String readerid) {
        this.readerid = readerid;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(String borrowtime) {
        this.borrowtime = borrowtime;
    }

    public int getBorrowday() {
        return borrowday;
    }

    public void setBorrowday(int borrowday) {
        this.borrowday = borrowday;
    }

    public String getComplete() {
        return complete;
    }

    public void setComplete(String complete) {
        this.complete = complete;
    }
}
