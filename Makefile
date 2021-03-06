TAXONOMY_DIR := data
DB = taxonomy.db

$(DB): clean taxids nodes names hosts

taxids:
	./add-accession-taxid.sh $(TAXONOMY_DIR)/nucl_gb.accession2taxid.gz $(DB)

nodes:
	./add-nodes.sh $(TAXONOMY_DIR)/nodes.dmp $(DB)

names:
	./add-names.sh $(TAXONOMY_DIR)/names.dmp $(DB)

hosts:
	./add-hosts.sh $(TAXONOMY_DIR)/host.dmp $(DB)

vacuum:
	./vaccum.sh $(DB)

clean:
	rm -f $(DB)
