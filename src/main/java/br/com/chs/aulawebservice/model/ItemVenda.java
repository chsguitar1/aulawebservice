/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.chs.aulawebservice.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author cristiano
 */
@Entity
@Table(name = "itemVenda")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ItemVenda.findAll", query = "SELECT i FROM ItemVenda i")
    , @NamedQuery(name = "ItemVenda.findByIdItvenda", query = "SELECT i FROM ItemVenda i WHERE i.idItvenda = :idItvenda")
    , @NamedQuery(name = "ItemVenda.findByVlrItvenda", query = "SELECT i FROM ItemVenda i WHERE i.vlrItvenda = :vlrItvenda")
    , @NamedQuery(name = "ItemVenda.findByQtdItvenda", query = "SELECT i FROM ItemVenda i WHERE i.qtdItvenda = :qtdItvenda")})
public class ItemVenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_itvenda")
    private Integer idItvenda;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "vlr_itvenda")
    private BigDecimal vlrItvenda;
    @Basic(optional = false)
    @NotNull
    @Column(name = "qtd_itvenda")
    private BigDecimal qtdItvenda;
    @JoinColumn(name = "id_produto", referencedColumnName = "id_produto")
    @ManyToOne(optional = false)
    private Produto idProduto;
    @JoinColumn(name = "id_venda", referencedColumnName = "id_venda")
    @ManyToOne(optional = false)
    private Venda idVenda;

    public ItemVenda() {
    }

    public ItemVenda(Integer idItvenda) {
        this.idItvenda = idItvenda;
    }

    public ItemVenda(Integer idItvenda, BigDecimal vlrItvenda, BigDecimal qtdItvenda) {
        this.idItvenda = idItvenda;
        this.vlrItvenda = vlrItvenda;
        this.qtdItvenda = qtdItvenda;
    }

    public Integer getIdItvenda() {
        return idItvenda;
    }

    public void setIdItvenda(Integer idItvenda) {
        this.idItvenda = idItvenda;
    }

    public BigDecimal getVlrItvenda() {
        return vlrItvenda;
    }

    public void setVlrItvenda(BigDecimal vlrItvenda) {
        this.vlrItvenda = vlrItvenda;
    }

    public BigDecimal getQtdItvenda() {
        return qtdItvenda;
    }

    public void setQtdItvenda(BigDecimal qtdItvenda) {
        this.qtdItvenda = qtdItvenda;
    }

    public Produto getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Produto idProduto) {
        this.idProduto = idProduto;
    }

    public Venda getIdVenda() {
        return idVenda;
    }

    public void setIdVenda(Venda idVenda) {
        this.idVenda = idVenda;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idItvenda != null ? idItvenda.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemVenda)) {
            return false;
        }
        ItemVenda other = (ItemVenda) object;
        if ((this.idItvenda == null && other.idItvenda != null) || (this.idItvenda != null && !this.idItvenda.equals(other.idItvenda))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.chs.aulawebservice.model.ItemVenda[ idItvenda=" + idItvenda + " ]";
    }
    
}
