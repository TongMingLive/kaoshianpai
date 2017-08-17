package dao;

import bean.Tiankong;
import bean.Xuanze;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tong- on 2017/5/3.
 */
public class Kaoshitimu {

    //添加填空题
    public int addTiankong(String zhuanyemingcheng,String timuTitle,String daan){
        String sql = "insert into tiankong(zhuanyemingcheng,timuTitle,daan) values('"+zhuanyemingcheng+"','"+timuTitle+"','"+daan+"')";
        System.out.println(sql);
        return db.db.executeSql(sql);
    }

    //查看所有填空题
    public List<Tiankong> selectAllTiankong(){
        String sql = "select * from tiankong";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Tiankong> list = new ArrayList<>();
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                while(rs.next()){
                    Tiankong tiankong = new Tiankong();
                    tiankong.setTimuId(rs.getInt("timuId"));
                    tiankong.setZhuanyemingcheng(rs.getString("zhuanyemingcheng"));
                    tiankong.setTimuTitle(rs.getString("timuTitle"));
                    tiankong.setDaan(rs.getString("daan"));
                    list.add(tiankong);
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //查看某系列填空题
    public List<Tiankong> selectTiankongByzy(String zhuanyemingcheng){
        String sql = "select * from tiankong where zhuanyemingcheng = '"+zhuanyemingcheng+"'";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Tiankong> list = new ArrayList<>();
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                while(rs.next()){
                    Tiankong tiankong = new Tiankong();
                    tiankong.setTimuId(rs.getInt("timuId"));
                    tiankong.setZhuanyemingcheng(rs.getString("zhuanyemingcheng"));
                    tiankong.setTimuTitle(rs.getString("timuTitle"));
                    tiankong.setDaan(rs.getString("daan"));
                    list.add(tiankong);
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //根据id查看填空题答案
    public String selectTiankongDaanById(int timuId){
        String sql = "select * from tiankong where timuId = "+timuId;
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        String daan = "";
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                if (rs.next()){
                    daan = rs.getString("daan");
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return daan;
    }

    //根据id删除填空题
    public int deleteTiankongById(int timuId){
        String sql = "delete from tiankong where timuId = "+timuId;
        System.out.println(sql);
        return db.db.executeSql(sql);
    }

    //添加选择题
    public int addXuanze(String zhuanyemingcheng,String timuTitle,String xuanze1,String xuanze2,String xuanze3,String xuanze4,int daan){
        String sql = "insert into xuanze(zhuanyemingcheng,timuTitle,xuanze1,xuanze2,xuanze3,xuanze4,daan) values('"+zhuanyemingcheng+"','"+timuTitle+"','"+xuanze1+"','"+xuanze2+"','"+xuanze3+"','"+xuanze4+"',"+daan+")";
        System.out.println(sql);
        return db.db.executeSql(sql);
    }

    //查看全部选择题
    public List<Xuanze> selectAllXuanzeByzy(){
        String sql = "select * from xuanze";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Xuanze> list = new ArrayList<>();
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                while(rs.next()){
                    Xuanze xuanze = new Xuanze();
                    xuanze.setTimuId(rs.getInt("timuId"));
                    xuanze.setZhuanyemingcheng(rs.getString("zhuanyemingcheng"));
                    xuanze.setTimuTitle(rs.getString("timuTitle"));
                    xuanze.setXuanze1(rs.getString("xuanze1"));
                    xuanze.setXuanze2(rs.getString("xuanze2"));
                    xuanze.setXuanze3(rs.getString("xuanze3"));
                    xuanze.setXuanze4(rs.getString("xuanze4"));
                    list.add(xuanze);
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //查看某系列选择题
    public List<Xuanze> selectXuanzeByzy(String zhuanyemingcheng){
        String sql = "select * from xuanze where zhuanyemingcheng = '"+zhuanyemingcheng+"'";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Xuanze> list = new ArrayList<>();
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                while(rs.next()){
                    Xuanze xuanze = new Xuanze();
                    xuanze.setTimuId(rs.getInt("timuId"));
                    xuanze.setZhuanyemingcheng(rs.getString("zhuanyemingcheng"));
                    xuanze.setTimuTitle(rs.getString("timuTitle"));
                    xuanze.setXuanze1(rs.getString("xuanze1"));
                    xuanze.setXuanze2(rs.getString("xuanze2"));
                    xuanze.setXuanze3(rs.getString("xuanze3"));
                    xuanze.setXuanze4(rs.getString("xuanze4"));
                    list.add(xuanze);
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //根据id查看选择题答案
    public int selectXuanzeDaanById(int timuId){
        String sql = "select * from xuanze where timuId = "+timuId;
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        int daan = 0;
        con = db.db.getconnection();
        try {
            st = con.createStatement();
            rs=st.executeQuery(sql);
            if (rs!=null){
                if (rs.next()){
                    daan = rs.getInt("daan");
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            db.db.closeConnectionAndStatement(rs,con,st);
        }
        return daan;
    }

    //根据id删除选择题
    public int deleteXuanzeById(int timuId){
        String sql = "delete from xuanze where timuId = "+timuId;
        System.out.println(sql);
        return db.db.executeSql(sql);
    }

    //更新学生成绩
    public int updateScore(int score,String xuehao){
        String sql = "update xueshengxinxi set score = "+score+" where xuehao = '"+xuehao+"'";
        System.out.println(sql);
        return db.db.executeSql(sql);
    }
}
