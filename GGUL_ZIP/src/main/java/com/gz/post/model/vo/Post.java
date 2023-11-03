package com.gz.post.model.vo;


import java.sql.Date;

import com.gz.admin.model.vo.Category;
import com.gz.member.model.vo.Member;
public class Post {
    
    private int postNo;
    private int memberNo;
    private int categoryNo;
    private String title;
    private String content;
    private int count;
    private String nickname;
    private Date postDate;
    private int likeCount;
    private int interestCount;
    private String status;
    private String categoryName;
    
    private Member member;
    private Category category;
    
    
    public Post(int postNo, int memberNo, int categoryNo, String title, String content, int count, String nickname,
            Date postDate, int likeCount, int interestCount, String status, String categoryName, Member member,
            Category category) {
        super();
        this.postNo = postNo;
        this.memberNo = memberNo;
        this.categoryNo = categoryNo;
        this.title = title;
        this.content = content;
        this.count = count;
        this.nickname = nickname;
        this.postDate = postDate;
        this.likeCount = likeCount;
        this.interestCount = interestCount;
        this.status = status;
        this.categoryName = categoryName;
        this.member = member;
        this.category = category;
    }
    public Post(int postNo, int memberNo, int categoryNo, String title, String content, int count, Date postDate,
            int likeCount, int interestCount, String status) {
        super();
        this.postNo = postNo;
        this.memberNo = memberNo;
        this.categoryNo = categoryNo;
        this.title = title;
        this.content = content;
        this.count = count;
        this.postDate = postDate;
        this.likeCount = likeCount;
        this.interestCount = interestCount;
        this.status = status;
    }
    public Post(int postNo, int categoryNo, String title, String content, int count, String nickname, Date postDate) {
        super();
        this.postNo = postNo;
        this.categoryNo = categoryNo;
        this.title = title;
        this.content = content;
        this.count = count;
        this.nickname = nickname;
        this.postDate = postDate;
        this.member = new Member(); // Member 객체를 생성
    }
    public Post(int postNo, String categoryName, String title, String content, int count, String memberNickname, Date postDate, int likeCount, int interestCount) {
        this.postNo = postNo;
        this.categoryName = categoryName;
        this.title = title;
        this.content = content;
        this.count = count;
        this.nickname = memberNickname;
        this.postDate = postDate;
        this.likeCount = likeCount;
        this.interestCount = interestCount;
    }
    
    
    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public int getPostNo() {
        return postNo;
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }
    public int getMemberNo() {
        return memberNo;
    }
    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }
    public int getCategoryNo() {
        return categoryNo;
    }
    public void setCategoryNo(int categoryNo) {
        this.categoryNo = categoryNo;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public Date getPostDate() {
        return postDate;
    }
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }
    public int getLikeCount() {
        return likeCount;
    }
    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }
    public int getInterestCount() {
        return interestCount;
    }
    public void setInterestCount(int interestCount) {
        this.interestCount = interestCount;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public Member getMember() {
        return member;
    }
    public void setMember(Member member) {
        this.member = member;
    }
    @Override
    public String toString() {
        return "Post [postNo=" + postNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo + ", title=" + title
                + ", content=" + content + ", count=" + count + ", nickname=" + nickname + ", postDate=" + postDate
                + ", likeCount=" + likeCount + ", interestCount=" + interestCount + ", status=" + status + ", member="
                + member + ", categoryName=" + categoryName + "]";
    }
}